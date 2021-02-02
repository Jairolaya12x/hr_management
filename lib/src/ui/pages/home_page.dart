import 'package:flutter/material.dart';
import 'package:hr_management/src/models/employer.dart';
import 'package:hr_management/src/ui/widgets/employed_card/employer_container.dart';
import 'package:hr_management/src/ui/widgets/search_component.dart';

List<Employer> defaultEmployers = [
  Employer(id: 2, name: 'Juanpis Gonzalez',wage: 4500000000, isNew: false),
  Employer(id: 2, name: 'Pepito Pérez',wage: 1000,isNew: true),
  Employer(id: 2, name: 'El profesor súper O',wage: 23,isNew: true),
  Employer(id: 2, name: 'El rano rené',wage: 1, isNew: false),
  Employer(id: 2, name: 'Carlangas',wage: 123456789, isNew: false),
  Employer(id: 2, name: 'The viking',wage: 546, isNew: false),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu_outlined),
            color: Colors.black,
            onPressed: () => print(''),
          ),
          //title: Text('My dashboard'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                              color: Color(0xffED6A5A),
                            ),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.perm_identity_sharp),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Employees (15)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text('Order by:'),
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: Row(
                                children: [
                                  Icon(Icons.attach_money_outlined),
                                  Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                              onPressed: () => print(''),
                            ),
                          ],
                        ),
                        ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => EmployerContainer(
                            employer: defaultEmployers[index],
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          itemCount: defaultEmployers.length,
                          shrinkWrap: true,
                        ),
                      ],
                    ),
                  ),
                  SearchComponent(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


