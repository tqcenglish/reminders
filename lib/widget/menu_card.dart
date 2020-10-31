import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminders/model/menu_card.dart';

typedef void StringCallback(ModelMenuCard val);

class MenuCard extends StatelessWidget {
  MenuCard(this._item, this.callback);
  final ModelMenuCard _item;
  final StringCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 5.0, right: 15, bottom: 5.0),
        height: 100,
        child: InkWell(
          onTap: () => {this.callback(_item)},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Card(
            color: _item.selected ? _item.activeColor : Colors.white,
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))),
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: _item.selected
                                    ? Colors.white
                                    : _item.activeColor,
                                borderRadius: BorderRadius.circular(1000)),
                            child: Container(
                                padding: EdgeInsets.all(3),
                                child: Image(
                                  color: _item.selected
                                      ? _item.activeColor
                                      : Colors.white,
                                  image: AssetImage(_item.iconPath),
                                )),
                          ),
                          Text(_item.count.toString(),
                              style: TextStyle(
                                  color: _item.selected
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      Text(_item.name,
                          style: TextStyle(
                              color:
                                  _item.selected ? Colors.white : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ])),
          ),
        ),
      ),
    );
  }
}
