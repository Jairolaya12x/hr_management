import 'package:flutter/material.dart';

const List<Color> defaultColors = [
  Colors.purple,
  Colors.redAccent,
  Colors.cyan,
  Colors.green,
  Colors.blueAccent,
];

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({@required this.id});

  final int id;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: defaultColors[((id % 10) / 2).floor()],
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
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      );
}
