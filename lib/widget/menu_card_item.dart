import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminders/model/song_group.dart';

typedef void SongGroupModelCallback(SongGroupModel val);

class MenuCardItem extends StatelessWidget {
  MenuCardItem(this._item, this.callback);
  final SongGroupModel _item;
  final SongGroupModelCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, top: 5.0, right: 5, bottom: 5.0),
      child: InkWell(
          onTap: () => {this.callback(_item)},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        _item.iconPath,
                        fit: BoxFit.fill,
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Text(_item.name,
                    style: TextStyle(
                      fontSize: 12,
                    )),
              ])),
    );
  }
}
