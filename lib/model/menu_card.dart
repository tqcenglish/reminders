import 'package:flutter/widgets.dart';

class ModelMenuCard {
  bool selected;
  String iconPath;
  String name;
  int count;
  Color activeColor;

  ModelMenuCard(
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
