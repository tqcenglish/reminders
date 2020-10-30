import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../route.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: double.infinity,
      child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: ListView(
              children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                title:
                    Text('今日计划', style: TextStyle(fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).pushNamed(Pages.Detail.toString());
                },
                trailing: Icon(Icons.arrow_right),
                leading: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1000)),
                    child: Image(
                      image: AssetImage("all.png"),
                      color: Colors.blue,
                    )),
              ),
              ListTile(
                title:
                    Text('今日计划', style: TextStyle(fontWeight: FontWeight.w500)),
                trailing: Icon(Icons.arrow_right),
                leading: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1000)),
                    child: Image(
                      image: AssetImage("all.png"),
                      color: Colors.blue,
                    )),
              ),
              ListTile(
                title:
                    Text('明日计划', style: TextStyle(fontWeight: FontWeight.w500)),
                trailing: Icon(Icons.arrow_right),
                leading: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1000)),
                    child: Image(
                      image: AssetImage("flag.png"),
                      color: Colors.red,
                    )),
              ),
              ListTile(
                title:
                    Text('所有计划', style: TextStyle(fontWeight: FontWeight.w500)),
                trailing: Icon(Icons.arrow_right),
                leading: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1000)),
                    child: Image(
                      image: AssetImage("flag.png"),
                      color: Colors.red,
                    )),
              )
            ],
          ).toList())),
    );
  }
}
