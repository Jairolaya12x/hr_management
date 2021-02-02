import 'package:flutter/material.dart';
import 'package:hr_management/src/models/employer.dart';
import 'package:hr_management/src/ui/widgets/employed_card/employer_container.dart';

class EmployeesContainerList extends StatelessWidget {
  EmployeesContainerList({@required this.employees});

  final List<Employer> employees;

  @override
  Widget build(BuildContext context) {
    if(employees == null) return CircularProgressIndicator();
    else if(employees.isEmpty) return Text('No employees found');
    return ListView.separated(
      itemBuilder: (_, index) => EmployerContainer(employer: employees[index],key: ValueKey(employees[index].id),),
      separatorBuilder: (_, index) => SizedBox(
        height: 10,
      ),
      itemCount: employees.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }
}
