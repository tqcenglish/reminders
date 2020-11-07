import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminders/api/service.dart';
import 'package:reminders/model/song_group.dart';
import 'package:reminders/route.dart';
import 'package:reminders/widget/menu_card_item.dart';

class MenuCard extends StatefulWidget {
  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  Widget _createItem(BuildContext context, int index) {
    return MenuCardItem(_data[index], _handleTap);
  }

  List<SongGroupModel> _data = new List();

  Future<void> _loadMoreData() async {
    var data = await searchGroups();
    if (mounted) {
      setState(() {
        _data = data.items;
      });
    }
  }

  @override
  void initState() {
    _loadMoreData();
    super.initState();
  }

  void _handleTap(SongGroupModel menuItem) {
    setState(() {
      Navigator.of(context).pushNamed(Pages.Detail.toString(), arguments: menuItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
      height: 140,
      child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _data.length, itemBuilder: _createItem),
    );
  }
}
