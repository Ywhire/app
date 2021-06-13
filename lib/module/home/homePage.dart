import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Diet Master"),
        ),
        drawer: SideDrawer(),
        body: Center(child: Text("Home")));
  }
}
