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
  final _focusNode = FocusNode();
  SearchProvider _searchProvider;

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
          _searchProvider.isSearchMode = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _searchProvider = Provider.of<SearchProvider>(context);
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
                    onSubmitted: (_) => _searchProvider.isSearchMode = false,
                    focusNode: _focusNode,
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
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffED6A5A),
                      borderRadius: BorderRadius.circular(15),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }
}