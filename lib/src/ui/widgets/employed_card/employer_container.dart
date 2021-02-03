import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/src/models/employer.dart';

const List<Color> defaultColors = [
  Colors.purple,
  Colors.redAccent,
  Colors.cyan,
  Colors.green,
  Colors.blueAccent,
];

class EmployerContainer extends StatelessWidget {
  EmployerContainer({@required this.employer,Key key}) : super(key: key);

  final Employer employer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: defaultColors[((employer.id % 10) / 2).floor()],
              ),
              child: Container(
                margin: EdgeInsets.all(
                  3,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  margin: EdgeInsets.all(3),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile2.jpg'),
                    ),
                  ),
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  employer.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  employer.position ??= '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('\$ ${employer.wage}'),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.supervised_user_circle),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${employer.employees.length ??= 0}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              if(employer.isNew) Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.green,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text(
                  'New user!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
