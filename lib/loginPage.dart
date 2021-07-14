import 'dart:developer';

import 'package:app/authenticaiton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  final Authentication _authentication = Authentication();

  String email = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextFormField(
                controller: emailCont,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Your Email",
                    icon: Icon(
                      Icons.mail,
                      color: Colors.amber,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextFormField(
                controller: passwordCont,
                onChanged: (val) {
                  setState(() {
                    pass = val;
                  });
                  log(pass);
                },
                decoration: InputDecoration(
                    hintText: "Your Password",
                    icon: Icon(
                      Icons.lock,
                      color: Colors.amber,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              width: 800.0,
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
                    log(email);
                    await _authentication.signIn(email: email, password: pass);
                  },
                  child: const Text("Login"),
                ),
              ),
            ),
          ]),
    );
  }
}
