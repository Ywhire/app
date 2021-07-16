import 'package:app/module/home/homePage.dart';
import 'package:app/module/mykitchen/my_kitchen_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Meals extends StatefulWidget {
  const Meals({
    Key key,
  }) : super(key: key);

  @override
  _MealState createState() => new _MealState();
}

class _MealState extends State<Meals> {
  String userId;

  Future<void> initializeFlutterFire() async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    initializeFlutterFire();
    setState(() {
      userId = FirebaseAuth.instance.currentUser.uid;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
      ),
      body: ViewingStock(userId),
    );
  }
}

class ViewingStock extends StatefulWidget {
  final String uid;
  ViewingStock(this.uid);

  @override
  _ViewingStockState createState() => _ViewingStockState();
}

class _ViewingStockState extends State<ViewingStock> {
  static var uId;
  static var uAddress;
  static int bamount;
  static String itemName;

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
    });
    fetchData();
    super.initState();
  }

  static Route<Object> dialogBuilder(BuildContext context, Object arguments) {
    TextEditingController myController = TextEditingController();
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => LoadingPage(
                        amount: int.parse(myController.text),
                        userAdress: uAddress.toString(),
                        uid: uId.toString(),
                        itemid: itemName.toString(),
                        baseAmount: bamount,
                      )));
            },
          )
        ],
      ),
    );
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
          List<DocumentSnapshot> listofDocSnap = snapshot.data.docs;
          if (!snapshot.hasData)
            return new Text('You do not have any item in your Stock');
          /*if(listofDocSnap.length == 0){
            return Center(child: Text("Please add items to your stock first",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),));
          }*/
          return new ListView.builder(
            itemCount: listofDocSnap.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    itemName = listofDocSnap[index].data()['name'];
                    bamount = listofDocSnap[index].data()['amount'];
                  });
                  Navigator.of(context).restorablePush(dialogBuilder);
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

  Future<void> updateItems() async {
    setState(() {
      if (widget.baseAmount < widget.amount) {
        cAmount = 0;
      } else {}
      cAmount = widget.baseAmount - widget.amount;
    });

    FirebaseFirestore.instance
        .collection('kitchen')
        .doc('${widget.userAdress}')
        .collection('items')
        .doc('${widget.itemid}')
        .update({'amount': cAmount});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
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
