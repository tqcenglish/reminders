import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:just_audio/just_audio.dart';
import 'package:reminders/api/service.dart';
import 'package:reminders/model/song.dart';
import 'package:reminders/page/detail/detail_item.dart';
import 'package:reminders/widget/indicator.dart';

import 'package:path_provider/path_provider.dart';

class DetailList extends StatefulWidget {
  @override
  _DetailListState createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  bool _showChild = false;
  final player = AudioPlayer();
  List<SongModel> _tasks = new List();
  String localFilePath;

  @override
  void initState() {
    _loadMoreData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future _loadFile(String url) async {
    final bytes = await readBytes(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);
    if (await file.exists()) {
      setState(() {
        localFilePath = file.path;
      });
    }
  }

  Future<void> _loadMoreData() async {
    var data = await searchSongs();
    if (mounted) {
      setState(() {
        _tasks = data.items;
        _showChild = true;
      });
    }
  }

  Widget _createItem(BuildContext context, int index) {
    return DetailListItem(_tasks[index], this._loadFile);
  }

  @override
  Widget build(BuildContext context) {
    // bus.on("update_dashboard", (arg) {
    //   setState(() {
    //     _showChild = false;
    //   });
    //   new Future.delayed(Duration(milliseconds: arg ?? 3000)).then((data) {
    //     _loadMoreData();
    //   });
    // });
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 50),
      alignment: Alignment.center,
      firstChild: Center(
        child: Text("没有任务"),
      ),
      secondChild: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: RefreshIndicator(
              child: IndicatorContainer(
                  showChild: _showChild,
                  child: ListView.builder(
                      itemCount: _tasks.length, itemBuilder: _createItem)),
              onRefresh: _loadMoreData,
            ),
          ),
          // localFilePath == null
          //     ? Container()
          //     : PlayerWidget(
          //         url: localFilePath,
          //       ),
        ],
      ),
      crossFadeState: _tasks.length == 0
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
