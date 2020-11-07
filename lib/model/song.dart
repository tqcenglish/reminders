import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SongModel {
  String iconPath;
  String singername;
  String hash;
  int duration;
  Color activeColor;

  static SongModel fromJson(Map<String, dynamic> input) {
    if (input == null) return null;
    return new SongModel()
    ..singername = input['singername']
    ..hash = input['hash']
    ..duration= input['duration']
    ..iconPath =  input['img'];
  }
}
