import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminders/model/song_group.dart';
import 'package:reminders/page/detail/detail_list.dart';
import 'package:reminders/widget/search.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final SongGroupModel _item = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("歌单"),
      ),
      body: Container(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 225,
                child: Image.network(
                  _item.iconPath,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Center(
                  child: ClipRRect(
                      child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                child: Opacity(
                  opacity: 0.9,
                  child: Container(
                    height: 225,
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              Column(
                                children: [
                                  Text(_item.name),
                                  Text(_item.specialname)
                                ],
                              )
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("关注",
                                    style: TextStyle(color: Colors.white)),
                                Text("分享",
                                    style: TextStyle(color: Colors.white))
                              ]),
                        ]),
                  ),
                ),
              ))),
            ],
          ),
          Search(),
          Expanded(child: DetailList())
        ],
      )),
    );
  }
}
