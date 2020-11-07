import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SongGroupModel {
  bool selected;
  String iconPath;
  String name;
  String specialname;
  int specialid;
  String nickname;
  int count;
  Color activeColor;

  SongGroupModel(
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

  static SongGroupModel fromJson(Map<String, dynamic> input) {
    if (input == null) return null;
    return new SongGroupModel()
    ..name = input['nickname']
    ..specialname = input['specialname']
    ..nickname = input['nickname']
    ..selected = false
    ..activeColor = Colors.blue[700]
    ..iconPath =  input['img']
    ..specialid = input['specialid'];
  }
}
