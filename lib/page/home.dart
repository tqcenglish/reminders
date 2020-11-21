import 'package:flutter/material.dart';
import 'package:reminders/model/menu_card.dart';
import 'package:reminders/model/menu_item.dart';
import 'package:reminders/utils/color.dart';
import 'package:reminders/widget/menu_card.dart';
import 'package:reminders/widget/menu_list.dart';
import 'package:reminders/widget/search.dart';

import '../route.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  var menuItems = [
    ModelMenuItem(name: "千千阙歌", color: Colors.red),
  ];

  //http://localhost:3000/playlist/hot
  //http://localhost:3000/playlist/detail?id=5001
  //http://localhost:3000/song/url?id=108418
  var menuCards = [
    ModelMenuCard(
      name: '华语',
      iconPath: 'today.png',
      count: 2,
      id: 5001,
      selected: true,
      activeColor: Colors.blue[700],
    ),
    ModelMenuCard(
      name: '流行',
      iconPath: 'schedule.png',
      count: 1,
      id: 1,
      selected: false,
      activeColor: Colors.orange,
    ),
    ModelMenuCard(
        name: '摇滚',
        iconPath: 'all.png',
        count: 114741,
        id: 2,
        selected: false,
        activeColor: Colors.grey[700]),
    ModelMenuCard(
      name: '民谣',
      iconPath: 'flag.png',
      count: 1001,
        id: 354550,
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
    Navigator.of(context).pushNamed(Pages.Detail.toString(), arguments: menuItem);
    // Navigator.of(context).pushNamed(Pages.Detail.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    '收藏',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            Expanded(child: MenuList(data: widget.menuItems)),
          ],
        ),
      ),
      // bottomNavigationBar:
      //     BottomAppBar(shape: CircularNotchedRectangle(), child: MenuAction()),
    );
  }
}
