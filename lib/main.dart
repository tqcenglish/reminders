import 'package:flutter/material.dart';
import 'package:reminders/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminders',
      home: MyHomePage(title: 'Home'),
    );
  }
}
