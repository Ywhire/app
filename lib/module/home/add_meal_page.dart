import 'dart:ffi';

import 'package:app/module/home/homePage.dart';
import 'package:app/module/mykitchen/my_kitchen_page.dart';
import 'package:app/routes/Routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Meals extends StatefulWidget {
  final String whichMeal;
  const Meals({
    Key key,
    this.whichMeal,
  }) : super(key: key);

  @override
  _MealState createState() => new _MealState();
}

class _MealState extends State<Meals> {
  String userId;
  String prefMeal;
  String firstLetter;

  Future<void> initializeFlutterFire() async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    initializeFlutterFire();
    setState(() {
      userId = FirebaseAuth.instance.currentUser.uid;
      prefMeal = widget.whichMeal;
      firstLetter = prefMeal.substring(0, 1);
      prefMeal =
          firstLetter.toUpperCase() + prefMeal.substring(1, prefMeal.length);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Meal for $prefMeal"),
      ),
      body: ViewingStock(
        uid: userId,
        whichMeal: prefMeal,
      ),
    );
  }
}

class ViewingStock extends StatefulWidget {
  final String whichMeal;
  final String uid;
  const ViewingStock({Key key, this.uid, this.whichMeal}) : super(key: key);

  @override
  _ViewingStockState createState() => _ViewingStockState();
}

class _ViewingStockState extends State<ViewingStock> {
  var uId;
  var uAddress;
  int bamount;
  String itemName;
  int amount;
  var itemid;
  String meal;

  Future<void> fetchData() async {
    var document = FirebaseFirestore.instance.collection('users').doc(uId);
    var a = await document.get();
    var documentData = a.data();
    var uaddress = documentData['address'];
    setState(() {
      uAddress = uaddress;
    });
  }

  @override
  void initState() {
    setState(() {
      uId = widget.uid;
      meal = widget.whichMeal;
    });
    fetchData();
    super.initState();
  }

  Future<int> createAlertDialog(BuildContext context) {
    TextEditingController myController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("How Much?"),
        content: TextField(
          controller: myController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text('Save'),
            onPressed: () {
              Navigator.of(context)
                  .pop(int.parse(myController.text.toString()));
            },
          )
        ],
      ),
    );
  }

  Future<void> updateItems() async {
    var cAmount;
    setState(() {
      if (bamount < amount) {
        cAmount = 0;
      } else {
        cAmount = bamount - amount;
      }
    });

    await FirebaseFirestore.instance
        .collection('kitchen')
        .doc(uAddress)
        .collection('items')
        .doc(itemid)
        .update({'amount': cAmount});
  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('kitchen')
            .doc(uAddress)
            .collection('items')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return new Center(child: CircularProgressIndicator());
          List<DocumentSnapshot> listofDocSnap = snapshot.data.docs;
          if (listofDocSnap.length == 0) {
            return Center(
                child: Text(
              "Please add items to your stock first",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ));
          }
          return new ListView.builder(
            itemCount: listofDocSnap.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    itemid = listofDocSnap[index].id;
                    itemName = listofDocSnap[index].data()['name'];
                    bamount = listofDocSnap[index].data()['amount'];
                  });
                  createAlertDialog(context).then((value) {
                    SnackBar dispose = SnackBar(
                        content: (value == null)
                            ? Text("No value entered")
                            : Text("Saving $value"));
                    ScaffoldMessenger.of(context).showSnackBar(dispose);
                    amount = value;
                    updateItems();
                    setState(() {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(uId)
                          .collection('meals')
                          .doc(meal)
                          .collection('meal')
                          .doc(itemid)
                          .set({'name': itemName, 'amount': amount});
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
                child: Card(
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
                ),
              );
            },
          );
        });
  }
}

class LoadingPage extends StatefulWidget {
  final int baseAmount;
  final String uid;
  final String userAdress;
  final String itemid;
  final int amount;
  const LoadingPage(
      {Key key,
      this.amount,
      this.uid,
      this.userAdress,
      this.itemid,
      this.baseAmount})
      : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  int cAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(
          child: Icon(Icons.save),
          onPressed: () {},
        ),
      ),
    );
  }
}

/*class AddMeal extends StatefulWidget {
  final int itemId;
  final int amount;

  const AddMeal({Key key, this.itemId, this.amount}) : super(key: key);

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  TextEditingController myController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
