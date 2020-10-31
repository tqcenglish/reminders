import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuAction extends StatefulWidget {
  @override
  _MenuActionState createState() => _MenuActionState();
}

class _MenuActionState extends State<MenuAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Icon(Icons.add_circle, color:Colors.blue[600], size: 30),
                ),
                Text("New Reminder",
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Text("Add List",
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
          ],
        ));
  }
}
