import 'package:flutter/material.dart';
import 'package:reminders/page/home.dart';
import 'package:reminders/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Songs',
      home: HomePage(title: 'Home'),
      routes: mainRoutes,
    );
  }
}
