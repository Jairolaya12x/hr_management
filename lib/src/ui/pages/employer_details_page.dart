import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hr_management/src/ui/widgets/employed_card/profile_photo.dart';
import 'package:hr_management/src/resources/employees_provider.dart';
import 'package:hr_management/src/ui/widgets/employed_card/employer_container.dart';

class EmployerDetailsPage extends StatelessWidget {
  EmployerDetailsPage({@required this.employer});

  final Employer employer;

  @override
  Widget build(BuildContext context) {
    final employeesProvider = Provider.of<EmployeesProvider>(context);
    final List<Employer> employees = Provider.of<EmployeesProvider>(context)
        .getFullEmployees(employer.employees);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employer Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData().copyWith(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: buttonContainer(employeesProvider),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topContainer(),
            subEmployeesContainer(employees),
          ],
        ),
      ),
    );
  }

  Widget topContainer() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            70,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: ProfilePhoto(
              id: employer.id,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  employer.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  employer.position ??= '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('\$ ${employer.wage}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget subEmployeesContainer(List<Employer> elements) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          child: Text(
            'Sub employees',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        (elements?.isEmpty ?? true)
            ? Text("This employer don't have sub employees")
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                  itemBuilder: (_, index) =>
                      EmployerContainer(employer: elements[index]),
                  separatorBuilder: (_, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: elements.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                ),
              ),
      ],
    );
  }

  Widget buttonContainer(EmployeesProvider employeesProvider) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 40,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        color: employer.isNew ? Colors.redAccent : Colors.green,
        child: Text(
          employer.isNew ? 'Remove as new user' : 'Mark as new user',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: () => employeesProvider.updateEmployerStatus(employer),
      ),
    );
  }
}
