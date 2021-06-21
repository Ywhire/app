import 'package:app/buttons.dart';
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RectanText(text: "Breakfast", color: Colors.amber),
                  PlusButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RectanText(text: "Lunch", color: Colors.amber),
                  PlusButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RectanText(text: "Dinner", color: Colors.amber),
                  PlusButton(),
                ],
              ),
            ],
          ),
        ));
  }
}
