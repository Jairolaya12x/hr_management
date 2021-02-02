import 'package:flutter/foundation.dart';

class Employer {
  int id;
  String name;
  double wage;
  List<Employer> employees;
  bool isNew;

  Employer({
    @required this.id,
    @required this.name,
    this.wage,
    this.employees,
    this.isNew,
  });

  Employer.fromJson(Map<String, dynamic> json) {
    id        = json['id'];
    name      = json['name'];
    wage      = json['wage'] ??= 0;
    employees = List.from(json['employes'].map((e) => Employer.fromJson(e)));
    isNew     = json['isNew'];
  }

  Map<String, dynamic> toJson() => {
    'id'        : id,
    'name'      : name,
    'wage'      : wage,
    'employees' : employees,
    'isNew'     : isNew,
  };
}
