import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

class MyKitchenPage extends StatelessWidget {
  static const String routeName = '/mykitchen';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("My Kitchen"),
        ),
        drawer: SideDrawer(),
        body: Center(child: Text("My Kitchen")));
  }
}