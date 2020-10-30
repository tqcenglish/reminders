import 'package:flutter/material.dart';
import 'package:reminders/api/service.dart';
import 'package:reminders/model/task.dart';
import 'package:reminders/page/detail/detail_item.dart';
import 'package:reminders/widget/indicator.dart';

class DetailList extends StatefulWidget {
  @override
  _DetailListState createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  bool _showChild = false;

  List<Task> _tasks = new List();

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
    // var data = await mockTasks();
    if (mounted) {
      setState(() {
        _tasks = mockTasks();
        _showChild = true;
      });
    }
  }

  Widget _createItem(BuildContext context, int index) {
    return DetailListItem(_tasks[index]);
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
          )
        ],
      ),
      crossFadeState: _tasks.length == 0
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
