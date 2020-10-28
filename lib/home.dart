import 'package:flutter/material.dart';
import 'package:reminders/widget/menu_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuCard(),
                      MenuCard(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuCard(),
                      MenuCard(),
                    ],
                  ),
                ]),
            Divider(),
            Text(
              'My Lists',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text('内容一',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  leading: Icon(
                    Icons.contact_phone,
                    color: Colors.blue[500],
                  ),
                ),
                ListTile(
                  title: Text('内容二',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  leading: Icon(
                    Icons.contact_phone,
                    color: Colors.blue[500],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
