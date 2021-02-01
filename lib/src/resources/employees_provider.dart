
import 'api/api.dart';
import 'package:hr_management/src/models/employe.dart';


export 'package:hr_management/src/models/employe.dart';

class EmployeesProvider {
  Future<List<Employe>> getEmployees() async {
    final response = await API().makeRequest(RequestMethod.Get, 'path').catchError((onError) => throw onError);
    return List.from(response['employes'].map((e) => Employe.fromJson(e)));
  }
}