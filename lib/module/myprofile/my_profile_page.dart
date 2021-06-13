import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

class MyProfilePage extends StatelessWidget {
  static const String routeName = '/myprofile';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
        ),
        drawer: SideDrawer(),
        body: Center(child: Text("My Profile")));
  }
}