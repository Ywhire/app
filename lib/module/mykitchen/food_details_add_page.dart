import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/module/fooddbmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodDetailsAddScreen extends StatefulWidget {
  final int id;

  FoodDetailsAddScreen(this.id);
  @override
  _FoodDetailsAddScreenState createState() => _FoodDetailsAddScreenState();
}

class _FoodDetailsAddScreenState extends State<FoodDetailsAddScreen> {
  int ingredientamount = 0;
  FoodData foodData;
  bool loading = true;
  String userId;
  var uAddress;

  Future<void> fetchData() async {
    var url = "https://api.nal.usda.gov/fdc/v1/food/${widget.id}?api_key=aNQ649BoLEb3xRcH1J7JwPikv8rlqkLkgXmO1nL0";
    var response = await http.get(url);
    var decodedResponse = convert.jsonDecode(response.body);
    foodData = FoodData.fromMap(decodedResponse);
    setState(() {
      userId = FirebaseAuth.instance.currentUser.uid;
      loading = false;
    });
    fetchAddress();
  }

  Future<void> fetchAddress() async{
    var document  = FirebaseFirestore.instance.collection('users').doc(userId);
    var a = await document.get();
    var documentData = a.data();
    var uaddress = documentData['address'];
    setState(() {
      uAddress = uaddress;
    });
  }

  Future<void> addItems() async {

    var document = FirebaseFirestore.instance.collection('kitchen').doc(uAddress).collection('items').doc('${widget.id}');
    var a = await document.get();
    var documentData = a.data();
    if (documentData == null) {
      FirebaseFirestore.instance
          .collection('kitchen')
          .doc(uAddress)
          .collection('items')
          .doc('${widget.id}')
          .set({
            'amount': ingredientamount,
            'name': foodData?.description??""
          });
      Navigator.of(context).pop();
    } else{
      int examount = documentData['amount'];
      int newamount = examount + ingredientamount;
      FirebaseFirestore.instance
          .collection('kitchen')
          .doc(uAddress)
          .collection('items')
          .doc('${widget.id}')
          .update({'amount': newamount});
      Navigator.of(context).pop();
    }
  }

  Future<String> createAlertDialog(BuildContext context){

    TextEditingController myController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("How Much?"),
        content: TextField(
          controller: myController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
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
              Navigator.of(context).pop(myController.text.toString());
            },
          )
        ],
      );
    });
  }

  Future<void> initializeFlutterFire() async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    initializeFlutterFire();
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right:20),
            child: GestureDetector(
              onTap: () {
                addItems();
              },
              child: Icon(
                  Icons.check,
                  size: 30
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top:10, left: 10),
        child: loading ? Center(child: CircularProgressIndicator()): Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Text(
              "${foodData?.description??""}",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: foodData.foodAttributes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Text(
                          "${foodData.foodAttributes[index].foodAttributeType.name}: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Expanded(
                          child: Text(
                            "${foodData.foodAttributes[index].value}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            TextButton(
                onPressed: () {
                  createAlertDialog(context).then((value) {
                    setState(() {
                      ingredientamount = int.parse(value);
                    });
                  });
                },
                child: Row(
                  children: [
                    Text(
                      "Quantity",
                    ),
                    Spacer(),
                    Text(
                      "${ingredientamount}",
                    )
                  ],
                )
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "Quantity Size",
                    ),
                    Spacer(),
                    Text(
                      "1.0 grams",
                    )
                  ],
                )
            ),
          ],),
      ),
    );
  }
}
