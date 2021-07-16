import 'dart:developer';

import 'package:app/authenticaiton.dart';
import 'package:app/module/home/homePage.dart';
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
  final Authentication _authentication = Authentication();

  bool isObscure = true;

  String email = "";
  String pass = "";
  String error = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("water.png"),
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop))),
      child: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
            child: TextFormField(
              validator: (val) => val.isEmpty ? "Enter an email" : null,
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
              decoration: InputDecoration(
                  hintText: "Your Email",
                  icon: Icon(
                    Icons.mail,
                    color: Colors.deepOrange[300],
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Your Password",
                  icon: Icon(
                    Icons.lock,
                    color: Colors.deepOrange[300],
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility
                    ),
                    onPressed: (){
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  )
              ),
              onChanged: (val) {
                setState(() {
                  pass = val;
                });
              },
              obscureText: isObscure,
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
                  backgroundColor: Colors.lightGreen[300],
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _authentication.signIn(
                        email: email, password: pass);
                    if (result != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      setState(() => error = "Given credential is not correct");
                    }
                  }
                },
                child: const Text("Login"),
              ),
            ),
          ),
          Text(
            error,
            style: TextStyle(color: Colors.red, fontSize: 14.0),
          )
        ]),
      ),
    );
  }
}
