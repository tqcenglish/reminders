import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminders/page/home.dart';

import 'page/detail/detail.dart';

enum Pages {
  Home,
  Detail,
  NotFound,
}

Map<String, WidgetBuilder> mainRoutes = <String, WidgetBuilder>{
  Pages.Home.toString(): (context) => HomePage(),
  Pages.Detail.toString(): (context) => Detail(),
};

void routePage(BuildContext context, path) {
  switch (path) {
    // case "login":
    //   Navigator.of(context).pushReplacementNamed(Pages.Login.toString());
    //   break;

    case "detail":
      Navigator.of(context).pushNamed(Pages.Detail.toString());
      break;
    default:
      Navigator.of(context).pushNamed(Pages.NotFound.toString());
  }
}
