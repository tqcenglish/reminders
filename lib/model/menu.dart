import 'package:flutter/widgets.dart';

class MenuItem {
  bool selected;
  String iconPath;
  String name;
  int count;
  Color activeColor;

  MenuItem(
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
}
