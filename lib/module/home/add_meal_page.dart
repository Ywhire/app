import 'package:app/module/home/homePage.dart';
import 'package:flutter/material.dart';

import '../../buttons.dart';

class BreakfastMeals extends StatefulWidget {
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String value5;

  const BreakfastMeals(
      {Key key,
      this.value1 = "Egg",
      this.value2 = "Milk",
      this.value3 = "Egg with Sausage",
      this.value4 = "Lentil soup",
      this.value5 = "Steak"})
      : super(key: key);

  @override
  _BreakfastMealState createState() => new _BreakfastMealState();
}

class _BreakfastMealState extends State<BreakfastMeals> {
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
                          breakfastText: "${widget.value1}",
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
                            breakfastText: "${widget.value2}",
                          ));
                  Navigator.of(context).push(route);
                }),
            RectanText(
              text: "${widget.value3}",
              color: Colors.amber,
              press: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage(
                          breakfastText: "${widget.value3}",
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
                          breakfastText: "${widget.value4}",
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
                          breakfastText: "${widget.value5}",
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

// data of lunch meals page
class LunchMeals extends StatefulWidget {
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String value5;

  const LunchMeals(
      {Key key,
      this.value1 = "Egg",
      this.value2 = "Milk",
      this.value3 = "Egg with Sausage",
      this.value4 = "Lentil soup",
      this.value5 = "Steak"})
      : super(key: key);

  @override
  _LunchMealState createState() => new _LunchMealState();
}

class _LunchMealState extends State<LunchMeals> {
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
                          lunchText: "${widget.value1}",
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
                            lunchText: "${widget.value2}",
                          ));
                  Navigator.of(context).push(route);
                }),
            RectanText(
              text: "${widget.value3}",
              color: Colors.amber,
              press: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage(
                          lunchText: "${widget.value3}",
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
                          lunchText: "${widget.value4}",
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
                          lunchText: "${widget.value5}",
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

class DinnerMeals extends StatefulWidget {
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String value5;

  const DinnerMeals(
      {Key key,
      this.value1 = "Egg",
      this.value2 = "Milk",
      this.value3 = "Egg with Sausage",
      this.value4 = "Lentil soup",
      this.value5 = "Steak"})
      : super(key: key);

  @override
  _DinnerMealState createState() => new _DinnerMealState();
}

class _DinnerMealState extends State<DinnerMeals> {
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
                          dinnerText: "${widget.value1}",
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
                            dinnerText: "${widget.value2}",
                          ));
                  Navigator.of(context).push(route);
                }),
            RectanText(
              text: "${widget.value3}",
              color: Colors.amber,
              press: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new HomePage(
                          dinnerText: "${widget.value3}",
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
                          dinnerText: "${widget.value4}",
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
                          dinnerText: "${widget.value5}",
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
