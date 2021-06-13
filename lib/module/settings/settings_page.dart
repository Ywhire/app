import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        drawer: SideDrawer(),
        body: Center(child: Text("Settings")));
  }
}