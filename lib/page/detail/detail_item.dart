import 'package:flutter/material.dart';
import 'package:reminders/model/song.dart';

typedef void StringCallback(String val);

class DetailListItem extends StatelessWidget {
  DetailListItem(this._task, this.callback);

  final StringCallback callback;
  final Song _task;
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
          onTap: () {
            print('click ${_task.name}');
            this.callback(_task.id);
          },
        ));
  }
}
