import 'package:flutter/material.dart';
import 'package:hr_management/src/models/employer.dart';
import 'package:hr_management/src/resources/employees_provider.dart';
import 'package:hr_management/src/resources/search_provider.dart';
import 'package:hr_management/src/ui/widgets/employed_card/employer_container.dart';
import 'package:hr_management/src/ui/widgets/employees_container.dart';
import 'package:hr_management/src/ui/widgets/search_component.dart';
import 'package:hr_management/src/ui/widgets/shortButton.dart';
import 'package:hr_management/src/ui/widgets/utils/expanded_animated_container.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<EmployeesProvider>(context, listen: false).getEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final employeesProvider = Provider.of<EmployeesProvider>(context);
    final _searchProvider = Provider.of<SearchProvider>(context);
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: EdgeInsets.only(top: 235),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ExpandedAnimatedContainer(
                          child: Container(
                            height: 50,
                          ),
                          expanded: _searchProvider.isSearchMode,
                        ),
                        Row(
                          children: [
                            Icon(Icons.perm_identity_sharp),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Employees ${employeesProvider.countEmployees != 0
                                  ? "(${employeesProvider.countEmployees})"
                                  : ''}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text('Order by:'),
                            ShortButton(),
                          ],
                        ),
                        EmployeesContainerList()
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
