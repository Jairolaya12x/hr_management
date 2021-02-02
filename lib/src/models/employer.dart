import 'package:flutter/foundation.dart';

class Employer {
  int id;
  String name;
  double wage;
  List<Employer> employees;
  bool isNew;
  String position;

  Employer({
    @required this.id,
    @required this.name,
    this.wage,
    this.employees,
    this.isNew,
    this.position,
  });

  Employer.fromJson(Map<String, dynamic> json) : isNew = false {
    try {
      id = json['id'];
      name = json['name'];
      wage = json['wage'] == null ? 0 : json['wage'] / 1;
      employees = json['employees'] == null ? null : List.from(json['employees'].map((e) => Employer.fromJson(e)));
      isNew = json['isNew'] == null ? false : true;
      position = json['position'] ??= '';
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'wage': wage,
        'employees': employees,
        'isNew': isNew,
      };
}
