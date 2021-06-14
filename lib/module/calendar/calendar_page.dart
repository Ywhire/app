import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

class CalendarPage extends StatelessWidget {
  static const String routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Calendar"),
        ),
        drawer: SideDrawer(),
        body: Center(child: Text("Calendar")));
  }
}