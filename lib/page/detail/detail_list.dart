import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:reminders/api/service.dart';
import 'package:reminders/model/song.dart';
import 'package:reminders/page/detail/detail_item.dart';
import 'package:reminders/widget/indicator.dart';

class DetailList extends StatefulWidget {
   DetailList({Key key, this.id}) : super(key: key);

  @override
  _DetailListState createState() => _DetailListState();
   final int  id;  
}

class _DetailListState extends State<DetailList> {
  bool _showChild = false;
  final player = AudioPlayer();
  List<Song> _songs = new List();

  @override
  void initState() {
    _loadMoreData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> _loadMoreData() async {
    var data = await searchSongs(widget.id);
    if (mounted) {
      setState(() {
        _songs = data.items;
        _showChild = true;
      });
    }
  }

  void _handleTap(String id) async {
    var url = await getSongUrl(id);
    // var url =
    // "http://ec.sycdn.kuwo.cn/fcfd92e6eaa674c3c7148b25f90829c8/5fb47eb3/resource/n1/62/45/178139152.mp3";
    if (url != "") {
      try {
        print(url);
        await player.setUrl(url);
        player.play();
      } catch (e) {
        print("Error: $e");
      }
    } else {
      final snackBar = SnackBar(content: Text('404 Not Found'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _createItem(BuildContext context, int index) {
    return DetailListItem(_songs[index], _handleTap);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 50),
      alignment: Alignment.center,
      firstChild: Center(
        child: Text("加载中"),
      ),
      secondChild: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: RefreshIndicator(
              child: IndicatorContainer(
                  showChild: _showChild,
                  child: ListView.builder(
                      itemCount: _songs.length, itemBuilder: _createItem)),
              onRefresh: _loadMoreData,
            ),
          )
        ],
      ),
      crossFadeState: _songs.length == 0
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
