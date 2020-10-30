import 'package:flutter/widgets.dart';

class Task {
  bool selected;
  String iconPath;
  String name;
  int count;
  Color activeColor;

  Task(
      {bool selected,
      String iconPath,
      String name,
      int count,
      Color activeColor}) {
    this.selected = selected;
    this.iconPath = iconPath;
    this.name = name;
    this.count = count;
    this.activeColor = activeColor;
  }

  static Task fromJson(Map<String, dynamic> input) {
    if (input == null) return null;
    // Map<String, dynamic> info = input['info'] as Map<String, dynamic>;
    return new Task()..name = input['name'];
  }
}
