import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminders/page/detail/detail_list.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表"),
      ),
      body: Container(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 15, bottom: 0),
                child: Text("阅读",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          Expanded(child: DetailList())
        ],
      )),
    );
  }
}
