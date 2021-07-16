import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class CreateUserInfo extends StatefulWidget {
  final uid;
  CreateUserInfo(this.uid);
  @override
  _CreateUserInfoState createState() => _CreateUserInfoState();
}

class _CreateUserInfoState extends State<CreateUserInfo> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String surname;
  String address;
  int age;
  int height;
  int weight;

  Future<void> passInfoToDb(userId) async {
    FirebaseFirestore.instance.collection('users').doc('$userId').set({
      'name': name,
      'surname': surname,
      'address': address,
      'height': height,
      'weight': weight,
      'age': age,
    });
    createKitchen(address);
  }

  Future<void> createKitchen(address) async {
    FirebaseFirestore.instance
        .collection('kitchen')
        .doc('$address')
        .collection('items')
        .doc('create')
        .set({'first': 0});
  }

  Future<void> initializeFlutterFire() async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User Info"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? "Enter your name" : null,
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Your Name",
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.amber,
                        )),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextFormField(
                    validator: (val) =>
                        val.isEmpty ? "Enter your surname" : null,
                    onChanged: (val) {
                      setState(() {
                        surname = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Your Surname",
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.amber,
                        )),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextFormField(
                    validator: (val) =>
                        val.isEmpty ? "Enter your address" : null,
                    onChanged: (val) {
                      setState(() {
                        address = val;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Your Address",
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.amber,
                        )),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) => val.isEmpty ? "Enter your age" : null,
                    onChanged: (val) {
                      setState(() {
                        age = int.parse(val);
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Your Age",
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.amber,
                        )),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val.isEmpty ? "Enter your height" : null,
                    onChanged: (val) {
                      setState(() {
                        height = int.parse(val);
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Your Height",
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.amber,
                        )),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val.isEmpty ? "Enter your weight" : null,
                    onChanged: (val) {
                      setState(() {
                        weight = int.parse(val);
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Your Weight",
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.amber,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          passInfoToDb(widget.uid);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
