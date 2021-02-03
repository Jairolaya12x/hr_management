import 'package:flutter/material.dart';
import 'package:hr_management/src/resources/employees_provider.dart';
import 'package:hr_management/src/resources/search_provider.dart';

import 'package:hr_management/src/ui/widgets/utils/expanded_animated_container.dart';
import 'package:provider/provider.dart';

class SearchComponent extends StatefulWidget {
  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  SearchProvider _searchProvider;
  EmployeesProvider _employeesProvider;

  @override
  void initState() {
    Future(
      () async {
        await Future.delayed(
          Duration(seconds: 1),
        );
        _searchProvider.isSearchMode = true;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _searchProvider = Provider.of<SearchProvider>(context);
    _employeesProvider = Provider.of<EmployeesProvider>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 750),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) => _employeesProvider.query = value,
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
            ExpandedAnimatedContainer(
              expanded: _searchProvider.isSearchMode,
              child: Column(
                children: [
                  Divider(
                    color: Colors.black54,
                  ),
                  Row(
                    children: [
                      Text(
                        'Filters:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => _employeesProvider.recentsFilter =
                            !_employeesProvider.recentsFilter,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 450),
                          curve: Curves.easeInOutQuart,
                          alignment: Alignment.center,
                          height: 30,
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 7),
                          decoration: BoxDecoration(
                            color: _employeesProvider.recentsFilter
                                ? Color(0xffED6A5A)
                                : Colors.black38,
                            borderRadius: BorderRadius.circular(
                                _employeesProvider.recentsFilter ? 15 : 10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.timelapse,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Recents',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
