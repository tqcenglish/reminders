import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuListItem extends StatelessWidget {
  const MenuListItem({Key key, this.name, this.color}) : super(key: key);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_right),
      onTap: () => {},
      leading: Container(
          width: 35,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(1000)),
          child: Image(
            image: AssetImage("menu.png"),
            height: 25,
            width: 25,
            color: Colors.white,
          )),
    );
  }
}
