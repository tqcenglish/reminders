import 'package:flutter/material.dart';
import 'package:reminders/model/song.dart';

typedef void IntCallback(int val);

class DetailListItem extends StatelessWidget {
  DetailListItem(this._task, this.callback);

  final IntCallback callback;
  final Song _task;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 2,
        child: ListTile(
          leading: Icon(Icons.play_arrow),
          title: Text(_task.name),
          trailing: Icon(Icons.more_vert),
          onTap: () {
            print('click ${_task.name}');
            this.callback(_task.id);
          },
        ));
  }
}
