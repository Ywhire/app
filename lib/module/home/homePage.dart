import 'package:app/authenticaiton.dart';
import 'package:app/buttons.dart';
import 'package:app/module/welcome/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

import 'add_meal_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  final String breakfastText;
  final String lunchText;
  final String dinnerText;
  const HomePage({
    Key key,
    this.breakfastText,
    this.lunchText,
    this.dinnerText,
  }) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Authentication _auth = Authentication();
  final List<String> entries = <String>['Breakfast', 'Lunch', 'Dinner'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Diet Master"),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.deepOrange[600],
              ),
              label: Text(
                "Signout",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      drawer: SideDrawer(),
      body: ListView.separated(
          padding: const EdgeInsets.all(8.0),
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 100,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ' ${entries[index]}',
                      style: TextStyle(fontSize: 30),
                    ),
                    InkWell(
                      child: Text(
                        "Add Item",
                        style: TextStyle(
                            color: Colors.lightGreen[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      onTap: () {},
                    ),
                  ],
                ));
          }),
    );
  }
}
