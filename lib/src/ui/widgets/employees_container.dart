import 'package:flutter/material.dart';
import 'package:hr_management/src/resources/employees_provider.dart';
import 'package:hr_management/src/ui/widgets/employed_card/employer_container.dart';
import 'package:provider/provider.dart';

class EmployeesContainerList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final employeesProvider = Provider.of<EmployeesProvider>(context);
    if(employeesProvider.status == EmployeesProviderStatus.loading) return CircularProgressIndicator();
    else if(employeesProvider.status == EmployeesProviderStatus.empty) return Text('No employees found');
    return ListView.separated(
      itemBuilder: (_, index) => EmployerContainer(employer: employeesProvider.employees[index]),
      separatorBuilder: (_, index) => SizedBox(
        height: 10,
      ),
      itemCount: employeesProvider.employees.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }
}
