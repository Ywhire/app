import 'package:app/authenticaiton.dart';
import 'package:app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  final String value;
  final String lunchText;
  const HomePage({
    Key key,
    this.value = "Breakfast",
    this.lunchText = "Lunch",
  }) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Authentication _auth = Authentication();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Diet Master"),
          actions: [
            TextButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.exit_to_app),
                label: Text(
                  "Signout",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        drawer: SideDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RectanText(text: "${widget.value}", color: Colors.amber),
                  PlusButton(press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavigatorMeals()),
                    );
                  })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RectanText(text: "${widget.lunchText}", color: Colors.amber),
                  PlusButton(press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavigatorMeals()),
                    );
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RectanText(text: "Dinner", color: Colors.amber),
                  PlusButton(press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavigatorMeals()),
                    );
                  }),
                ],
              ),
            ],
          ),
        ));
  }
}

class NavigatorMeals extends StatefulWidget {
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String value5;

  const NavigatorMeals(
      {Key key,
      this.value1 = "Egg",
      this.value2 = "Milk",
      this.value3 = "Egg with Sausage",
      this.value4 = "Lentil soup",
      this.value5 = "Steak"})
      : super(key: key);

  @override
  _MealState createState() => new _MealState();
}

class _MealState extends State<NavigatorMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RectanText(
              text: "${widget.value1}",
              color: Colors.amber,
              press: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage(
                          value: "${widget.value1}",
                        ));
                Navigator.of(context).push(route);
              },
            ),
            RectanText(
                text: "${widget.value2}",
                color: Colors.amber,
                press: () {
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new HomePage(
                            value: "${widget.value2}",
                          ));
                  Navigator.of(context).push(route);
                }),
            RectanText(
              text: "${widget.value3}",
              color: Colors.amber,
              press: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage(
                          value: "${widget.value3}",
                        ));
                Navigator.of(context).push(route);
              },
            ),
            RectanText(
              text: "${widget.value4}",
              color: Colors.amber,
              press: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage(
                          value: "${widget.value4}",
                        ));
                Navigator.of(context).push(route);
              },
            ),
            RectanText(
              text: "${widget.value5}",
              color: Colors.amber,
              press: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage(
                          value: "${widget.value5}",
                        ));
                Navigator.of(context).push(route);
              },
            )
          ],
        ),
      ),
    );
  }
}
