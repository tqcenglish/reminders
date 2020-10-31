import 'package:flutter/material.dart';
import 'package:reminders/model/menu_card.dart';
import 'package:reminders/model/menu_item.dart';
import 'package:reminders/utils/color.dart';
import 'package:reminders/widget/menu_action.dart';
import 'package:reminders/widget/menu_card.dart';
import 'package:reminders/widget/menu_list.dart';
import 'package:reminders/widget/search.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  var menuItems = [
    ModelMenuItem(
      name: "今日计划1",
      color: Colors.red
      ),
       ModelMenuItem(
      name: "今日计划2",
      color: Colors.red
      ),
       ModelMenuItem(
      name: "今日计划3",
      color: Colors.red
      ),
       ModelMenuItem(
      name: "今日计划",
      color: Colors.red
      ),
  ];
  var menuCards = [
    ModelMenuCard(
      name: 'Today',
      iconPath: 'today.png',
      count: 2,
      selected: true,
      activeColor: Colors.blue[700],
    ),
    ModelMenuCard(
      name: 'Scheduled',
      iconPath: 'schedule.png',
      count: 1,
      selected: false,
      activeColor: Colors.orange,
    ),
    ModelMenuCard(
        name: 'All',
        iconPath: 'all.png',
        count: 14,
        selected: false,
        activeColor: Colors.grey[700]),
    ModelMenuCard(
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
  void _handleTap(ModelMenuCard menuItem) {
    setState(() {
      for (var item in widget.menuCards) {
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
        color: customColor('0xf2f2f7'),
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
                        MenuCard(widget.menuCards[0], this._handleTap),
                        MenuCard(widget.menuCards[1], this._handleTap),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuCard(widget.menuCards[2], this._handleTap),
                      MenuCard(widget.menuCards[3], this._handleTap),
                    ],
                  ),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    'My Lists',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            Expanded(child: MenuList(data: widget.menuItems)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: MenuAction()
      ),
    );
  }
}
