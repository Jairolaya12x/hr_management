import 'package:flutter/material.dart';
import 'package:hr_management/src/resources/employees_provider.dart';
import 'package:provider/provider.dart';

const downIcon = Icons.keyboard_arrow_down;
const upIcon = Icons.keyboard_arrow_up;

class ShortButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _employeesProvider = Provider.of<EmployeesProvider>(context);
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Row(
        children: [
          Icon(Icons.attach_money_outlined,size: 18,),
          Icon(
            _employeesProvider.ascMode ? upIcon : downIcon,
          ),
        ],
      ),
      onPressed: () {
        print('algo');
        _employeesProvider.ascMode = !_employeesProvider.ascMode;
        //_employeesProvider.shortEmployeesList(_employeesProvider.ascMode);
      },
    );
  }
}
