import 'package:flutter/foundation.dart';

class Employe {
  int id;
  String name;
  double wage;
  List<Employe> employees;
  bool isNew;

  Employe({
    @required this.id,
    @required this.name,
    this.wage,
    this.employees,
    this.isNew,
  });

  Employe.fromJson(Map<String, dynamic> json) {
    id        = json['id'];
    name      = json['name'];
    wage      = json['wage'] ??= 0;
    employees = List.from(json['employes'].map((e) => Employe.fromJson(e)));
    isNew     = json['isNew'];
  }

  Map<String, dynamic> toJson() => {
    'id'      : id,
    'name'    : name,
    'wage'    : wage,
    'employes': employees,
    'isNew'   : isNew,
  };
}
