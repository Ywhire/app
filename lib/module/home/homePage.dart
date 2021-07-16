import 'dart:developer';

import 'package:app/authenticaiton.dart';
import 'package:app/buttons.dart';
import 'package:app/module/welcome/welcomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

import 'add_meal_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  final int amount;
  final String itemName;
  const HomePage({
    Key key,
    this.amount,
    this.itemName,
  }) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _userid = FirebaseAuth.instance.currentUser.uid;

  Future<void> updateBreakfast(
      String itemName, String amount, String itemId) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(_userid)
        .collection('meals')
        .doc('breakfast')
        .collection(itemId)
        .doc();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Diet Master"),
      ),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  // Add item to the breakfast part

                  ListTile(
                    title: Text(
                      'Breakfast',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: InkWell(
                      child: Text(
                        "Add Item ",
                        style: TextStyle(
                            color: Colors.lightGreen[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Meals()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  // Add item to the lunch part
                  ListTile(
                    title: Text(
                      'Lunch',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: InkWell(
                      child: Text(
                        "Add Item",
                        style: TextStyle(
                            color: Colors.lightGreen[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Meals()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(_userid)
                    .collection('meals')
                    .doc('breakfast')
                    .collection('meal')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) return new Text('Loading...');
                  List<DocumentSnapshot> listofDocSnap = snapshot.data.docs;
                  if (listofDocSnap.length == 0) {
                    return Center(
                        child: Text(
                      "Please add items to your stock first",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ));
                  }

                  return new ListView.builder(
                    itemCount: listofDocSnap.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Row(
                          children: [
                            Text(
                              listofDocSnap[index].data()['name'] == null
                                  ? ""
                                  : listofDocSnap[index].data()['name'],
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Text(
                              "${listofDocSnap[index].data()['amount'].toString()}g",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )),
                      );
                    },
                  );
                }),
            Card(
              child: Column(
                children: [
                  // Add item to the Dinner part
                  ListTile(
                    title: Text(
                      'Dinner',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: InkWell(
                      child: Text(
                        "Add Item",
                        style: TextStyle(
                            color: Colors.lightGreen[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Meals()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
