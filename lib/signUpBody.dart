import 'package:app/authenticaiton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/module/home/homePage.dart';

import 'module/home/firs_time_info_page.dart';

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final Authentication _authentication = Authentication();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String pass = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                      color: Colors.amber,
                    )),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextFormField(
                validator: (val) => val.isEmpty ? "Enter an password" : null,
                onChanged: (val) {
                  setState(() {
                    pass = val;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Your Password",
                    icon: Icon(
                      Icons.lock,
                      color: Colors.amber,
                    )),
              ),
            ),

            // sign up button
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
                      dynamic result = await _authentication.register(
                          email: email, password: pass);
                      if (result != null) {
                        var firebaseUser = FirebaseAuth.instance.currentUser;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateUserInfo(firebaseUser.uid)));
                      } else {
                        setState(() => error = "This e-mail is already registered.");
                      }
                    }
                  },
                  child: const Text("Register"),
                ),
              ),
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
