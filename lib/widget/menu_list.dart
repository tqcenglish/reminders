import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminders/model/menu_item.dart';
import 'package:reminders/widget/menu_list_item.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key key, this.data}) : super(key: key);
 
  final List<ModelMenuItem>   data;

    Widget _createItem(BuildContext context, int index) {
    var e = data[index];
    return MenuListItem(name:e.name, color: e.color);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
      height: double.infinity,
      child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: ListView.builder(itemCount: data.length, itemBuilder: _createItem )),
    );
  }
}
