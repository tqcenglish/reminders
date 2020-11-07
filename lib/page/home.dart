import 'package:flutter/material.dart';
import 'package:reminders/model/menu_item.dart';
import 'package:reminders/utils/color.dart';
import 'package:reminders/widget/menu_card.dart';
import 'package:reminders/widget/menu_list.dart';
import 'package:reminders/widget/play_action.dart';
import 'package:reminders/widget/search.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  var menuItems = [
    ModelMenuItem(name: "爱情买卖1", color: Colors.red),
    ModelMenuItem(name: "爱情买卖2", color: Colors.red),
    ModelMenuItem(name: "爱情买卖3", color: Colors.red),
    ModelMenuItem(name: "爱情买卖", color: Colors.red),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: customColor('0xf2f2f7'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Search(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    '流行歌单',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            MenuCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    '我的收藏',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            Expanded(child: MenuList(data: widget.menuItems)),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomAppBar(shape: CircularNotchedRectangle(), child: PlayAction()),
    );
  }
}
