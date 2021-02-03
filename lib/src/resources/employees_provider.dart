import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'api/api.dart';
import 'package:hr_management/src/utils/list_utils.dart';
import 'package:hr_management/src/models/employer.dart';

export 'package:hr_management/src/models/employer.dart';

class EmployeesProvider extends ChangeNotifier {
  //Search Properties

  bool _ascMode = false;
  bool _recentsFilter = false;
  String _query = '';

  set ascMode(bool value) {
    _ascMode = value;
    updateList();
  }

  get ascMode => _ascMode;

  set recentsFilter(bool value) {
    _recentsFilter = value;
    updateList();
  }

  get recentsFilter => _recentsFilter;

  set query(String value) {
    _query = value;
    updateList();
  }

  get query => _query;

  List<Employer> employees;
  int countEmployees = 0;

  List<Employer> _employees;

  EmployeesProviderStatus status = EmployeesProviderStatus.loading;

  Future<void> filterEmployeesName() async {
    List<Employer> result;
    result = ListUtils.filterList(
      (element) => element.name.toLowerCase().contains(query.toLowerCase()),
      _employees,
    );
    employees = result;
  }

  Future<void> filterEmployeesRecents() async {
    List<Employer> result;
    result = ListUtils.filterList(
          (element) => element.isNew,
      _query.length > 1 ? employees : _employees,
    );
    employees = result;
  }

  Future<void> shortEmployeesList() async {
    List<Employer> result;
    if (_ascMode) {
      result = ListUtils.shortList(
        (Employer currentElement, Employer nextElement) =>
            currentElement.wage > nextElement.wage,
        employees,
      );
    } else {
      result = ListUtils.shortList(
        (Employer currentElement, Employer nextElement) =>
            currentElement.wage < nextElement.wage,
        employees,
      );
    }
    employees = result;
  }

  void updateList() {
    cleanEmployeesList();
    //Name
    if(_query.length > 1) filterEmployeesName();
    else if(_query.isEmpty) employees = _employees;
    //Recents
    if(_recentsFilter) filterEmployeesRecents();
    shortEmployeesList();
    status = EmployeesProviderStatus.done;
    countEmployees = employees.length;
    notifyListeners();
  }

  Future<void> getEmployees() async {
    cleanEmployeesList();
    if (_employees == null) {
      final result = await API()
          .makeRequest(RequestMethod.Get, '/sapardo10/content/master/RH.json')
          .catchError(
            (onError) => setOnError(),
          );
      _employees =
          List.from(result['employees'].map((e) => Employer.fromJson(e)));
      updateEmployeesList(_employees);
    }
  }

  List<Employer> getFullEmployees(List<Employer> origin) {
    final tl = List<Employer>();
    for (Employer item in origin) {
      final element = ListUtils.findElement((Employer element) => element.id == item.id, _employees);
      if(element != null) tl.add(element);
    }
    return tl;
  }

  void setOnError() {
    status = EmployeesProviderStatus.empty;
    notifyListeners();
  }

  void cleanEmployeesList() {
    if(status == EmployeesProviderStatus.loading) return;
    status = EmployeesProviderStatus.loading;
    notifyListeners();
  }

  void updateEmployeesList(List<Employer> value) {
    status = EmployeesProviderStatus.done;
    employees = value;
    countEmployees = value.length;
    notifyListeners();
  }

  void updateEmployerStatus(Employer employer) {
    employer.isNew = !employer.isNew;
    notifyListeners();
  }
}

enum EmployeesProviderStatus {
  done,
  empty,
  loading,
}
