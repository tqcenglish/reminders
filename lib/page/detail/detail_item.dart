import 'package:flutter/material.dart';
import 'package:reminders/model/task.dart';

class DetailListItem extends StatelessWidget {
  DetailListItem(this._task);

  final Task _task;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 2,
        child: ListTile(
          leading: Icon(Icons.flag),
          title: Text(_task.name),
          trailing: Icon(Icons.more_vert),
          onTap: () {},
        ));
  }
}
