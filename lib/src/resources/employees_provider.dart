import 'package:flutter/material.dart';

import 'api/api.dart';
import 'package:hr_management/src/models/employer.dart';

export 'package:hr_management/src/models/employer.dart';

class EmployeesProvider extends ChangeNotifier {
  List<Employer> employees;
  int countEmployees = 0;

  bool _showPanel = false;

  Future<void> getEmployeesP() async {
    final response = await API()
        .makeRequest(RequestMethod.Get, '/sapardo10/content/master/RH.json')
        .catchError((onError) => throw onError);
    final List<Employer> algo =
        List.from(response['employees'].map((e) => Employer.fromJson(e)));
    employees = algo;
    countEmployees = algo.length;
    notifyListeners();
  }

  Future<void> getEmployeesPrimary() async {
    final response = await API()
        .makeRequest(RequestMethod.Get, '/sapardo10/content/master/RH.json')
        .catchError((onError) {
          employees = null;
          notifyListeners();
    } );
    final List<Employer> algo =
    List.from(response['employees'].map((e) => Employer.fromJson(e)));
    employees = algo.sublist(0,5);
    countEmployees = 5;
    notifyListeners();
  }

  set showPanel(bool value) {
    _showPanel = value;
    notifyListeners();
  }
  bool get showPanel => _showPanel;
}
