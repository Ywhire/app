import 'dart:developer';
import 'package:app/module/mykitchen/food_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';
import 'package:app/module/mykitchen/add_stock_item.dart';
import '../fooddbmodel.dart';

class MyKitchenPage extends StatefulWidget {
  static const String routeName = '/mykitchen';

  @override
  _MyKitchenPageState createState() => _MyKitchenPageState();
}

class _MyKitchenPageState extends State<MyKitchenPage> {
  FoodData foodData;
  bool loading = false;
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
    return new Scaffold(
      appBar: AppBar(
        title: Text("My Kitchen"),
      ),
      drawer: SideDrawer(),
      body: loading ? Center(child: CircularProgressIndicator()): StockList(userId),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStockItem()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}

class StockList extends StatefulWidget {

  final String id;
  StockList(this.id);

  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {

  var uId;
  var uAddress;



  Future<void> fetchData() async{
    var document  = FirebaseFirestore.instance.collection('users').doc(uId);
    var a = await document.get();
    var documentData = a.data();
    var uaddress = documentData['address'];
    setState(() {
      uAddress = uaddress;
    });
    FirebaseFirestore.instance.collection('kitchen').doc(uAddress).collection('items').doc('create').delete();
  }

  @override
  void initState() {
    setState(() {
      uId = widget.id;
    });
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('kitchen').doc(uAddress).collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          List<DocumentSnapshot> listofDocSnap = snapshot.data.docs;
          if(!snapshot.hasData) return new Text('Loading...');
          if(listofDocSnap.length == 0){
            return Center(child: Text("Please add items to your stock first",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),));
          }
          return new ListView.builder(
            itemCount: listofDocSnap.length,
            itemBuilder: (context, index) {
              return InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsScreen(int.parse(listofDocSnap[index].id.toString()), int.parse(listofDocSnap[index].data()['amount'].toString()))));
              },
                child: Card(
                  child: ListTile(
                      title: Row(
                        children: [
                          Text(listofDocSnap[index].data()['name']==null?"":listofDocSnap[index].data()['name'],
                            style: TextStyle(fontSize: 20),),
                          Spacer(),
                          Text("${listofDocSnap[index].data()['amount'].toString()}g",
                            style: TextStyle(fontSize: 20),),
                        ],
                      )
                  ),
                ),
              );
            },
          );
        });
  }
}

