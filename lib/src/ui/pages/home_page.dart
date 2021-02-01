import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          //title: Text('My dashboard'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 80,
                  ),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/image_woman.jpg'),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Carolina,\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xffED6A5A)),
                        ),
                        TextSpan(
                          text: '\t\tcongrats for u sales!',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5D576B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    margin: EdgeInsets.only(top: 235),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.group_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Total Employees (15)'),
                            Expanded(
                              child: Container(),
                            ),
                            IconButton(
                              icon: Icon(Icons.tune_outlined),
                              onPressed: () => print(''),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 215, right: 30, left: 30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              isCollapsed: true,
                              hintText: 'Search employer',
                            ),
                          ),
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
