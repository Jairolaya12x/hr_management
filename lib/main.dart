import 'package:flutter/material.dart';
import 'package:hr_management/src/resources/employees_provider.dart';
import 'package:hr_management/src/resources/search_provider.dart';
import 'package:hr_management/src/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EmployeesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
