import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:reminders/utils/color.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              filled: true,
              fillColor: customColor('0xe3e3e9'),
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 25,
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(5)),
        ),
      ),
    );
  }
}
