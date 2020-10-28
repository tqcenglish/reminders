import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuCard extends StatelessWidget {
  // const MenuCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Card(
          elevation: 15,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.contact_phone,
                      color: Colors.blue[500],
                    ),
                    Text('Today'),
                  ]),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('0'),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
