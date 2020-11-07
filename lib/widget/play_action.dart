import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayAction extends StatefulWidget {
  @override
  _PlayActionState createState() => _PlayActionState();
}

class _PlayActionState extends State<PlayAction> {
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
                // Container(
                //   margin: EdgeInsets.only(right: 8),
                //   child: Image(image:AssetImage("schedule.png")),
                // ),
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
