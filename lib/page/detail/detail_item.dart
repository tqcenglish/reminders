import 'package:flutter/material.dart';
import 'package:reminders/api/common.dart';
import 'package:reminders/model/song.dart';

typedef void StringCallback(String val);
class DetailListItem extends StatelessWidget {
  DetailListItem(this._task, this.callback);

  final SongModel _task;
  final StringCallback callback;


  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 2,
        child: ListTile(
          leading: Icon(Icons.flag),
          title: Text(_task.singername),
          trailing: Icon(Icons.more_vert),
          onTap: () {
            //播放
            this.callback(url);
          },
        ));
  }
}
