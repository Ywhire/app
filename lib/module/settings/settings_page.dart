import 'package:app/buttons.dart';
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
        body: Center(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Row(
                children: <Widget>[
                RectanText(text: "Change Profile ", color: Colors.white)
                ],
              ),
                Row(
                  children: <Widget>[
                    RectanText(text: "Delete Account", color: Colors.white)
                  ],
                ),
                Row(
                  children: <Widget>[
                    RectanText(text: " Change Account", color: Colors.white)
                  ],
                ),
                Row(
                  children: <Widget>[
                    RectanText(text: "Quit Account", color: Colors.white)
                  ],
                ),
              ],
            ),
        )
    );
  }
}