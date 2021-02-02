
import 'api/api.dart';
import 'package:hr_management/src/models/employer.dart';


export 'package:hr_management/src/models/employer.dart';

class EmployeesProvider {
  Future<List<Employer>> getEmployees() async {
    final response = await API().makeRequest(RequestMethod.Get, 'path').catchError((onError) => throw onError);
    return List.from(response['employes'].map((e) => Employer.fromJson(e)));
  }
}