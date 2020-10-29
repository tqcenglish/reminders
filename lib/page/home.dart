import 'package:flutter/material.dart';
import 'package:reminders/model/menu.dart';
import 'package:reminders/widget/menu_card.dart';
import 'package:reminders/widget/menu_list.dart';
import 'package:reminders/widget/search.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  var menuItems = [
    MenuItem(
      name: 'Today',
      iconPath: 'today.png',
      count: 2,
      selected: true,
      activeColor: Colors.blue[700],
    ),
    MenuItem(
      name: 'Scheduled',
      iconPath: 'schedule.png',
      count: 1,
      selected: false,
      activeColor: Colors.orange,
    ),
    MenuItem(
        name: 'All',
        iconPath: 'all.png',
        count: 14,
        selected: false,
        activeColor: Colors.grey[700]),
    MenuItem(
      name: 'Flagged',
      iconPath: 'flag.png',
      count: 4,
      selected: false,
      activeColor: Colors.red,
    ),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _handleTap(MenuItem menuItem) {
    setState(() {
      for (var item in widget.menuItems) {
        if (item.name == menuItem.name) {
          item.selected = true;
        } else {
          item.selected = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Search(),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MenuCard(widget.menuItems[0], this._handleTap),
                        MenuCard(widget.menuItems[1], this._handleTap),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuCard(widget.menuItems[2], this._handleTap),
                      MenuCard(widget.menuItems[3], this._handleTap),
                    ],
                  ),
                ]),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    '我的列表',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(child: MenuList())
          ],
        ),
      ),
    );
  }
}
