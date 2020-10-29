import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
              filled: true,
              fillColor: Colors.white,
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              contentPadding: EdgeInsets.all(5)),
        ),
      ),
    );
  }
}
