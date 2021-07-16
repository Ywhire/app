import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../authenticaiton.dart';

class changePasswordPage extends StatefulWidget {
  @override
  _changePasswordPageState createState() => _changePasswordPageState();
}

class _changePasswordPageState extends State<changePasswordPage> {

  bool isDisabled = true;
  bool isObscure0 = true;
  bool isObscure1 = true;
  String newPass0 = '0';
  String newPass1 = '1';
  String err0;
  String err1;
  final Authentication _auth = Authentication();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Change Password"),
    ),
    body: Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "New Password",
                  hintText: "New Password",
                  helperText: "6 characters minimum",
                  errorText: this.err0,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure0 ? Icons.visibility_off : Icons.visibility
                    ),
                    onPressed: (){
                      setState(() {
                        isObscure0 = !isObscure0;
                      });
                    },
                  )
                ),
                onTap: () {
                  if(_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
                onChanged: (val) {
                  if(val.length > 5){
                    setState(() {
                      err0 = null;
                    });
                  }
                  setState(() {
                    newPass0 = val;
                  });
                },
                onSaved: (val) {
                  if(0 < val.length && val.length < 6){
                    setState(() {
                      err0 = 'Password must contain at least 6 characters.';
                    });
                  }
                  else {
                    setState(() {
                      err0 = null;
                    });
                  }
                },
                obscureText: isObscure0,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: TextFormField(
                onTap: () {
                  if(_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
                onChanged: (val) {
                  setState(() {
                    newPass1 = val;
                  });
                  if(val.length == 0){
                    setState(() {
                      isDisabled = true;
                    });
                  }else {
                    if(newPass0 != newPass1){
                      setState(() {
                        err1 = 'Your passwords do not match.';
                        isDisabled = true;
                      });
                    }else{
                      setState(() {
                        err1 = null;
                      });
                      if(err0 == null && err1 == null){
                        setState(() {
                          isDisabled = false;
                        });
                      }
                    }
                  }
                },
                onSaved: (val) {
                  if(val.length == 0){
                    setState(() {
                      isDisabled = true;
                    });
                  }else {
                    if(val.length > 0 && newPass0 != newPass1){
                      setState(() {
                        err1 = 'Your passwords do not match.';
                        isDisabled = true;
                      });
                    }else {
                      setState(() {
                        err1 = null;
                      });
                      if(err0 == null && err1 == null){
                        setState(() {
                          isDisabled = false;
                        });
                      }
                    }
                  }
                },
                decoration: InputDecoration(
                    labelText: "Re-type New Password",
                    hintText: "Re-type New Password",
                    errorText: this.err1,
                    suffixIcon: IconButton(
                      icon: Icon(
                          isObscure1 ? Icons.visibility_off : Icons.visibility
                      ),
                      onPressed: (){
                        setState(() {
                          isObscure1 = !isObscure1;
                        });
                      },
                    )
                ),
                obscureText: isObscure1,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style: isDisabled ? TextButton.styleFrom(
                    //padding: const EdgeInsets.symmetric(vertical: 10),
                    primary: Colors.blueGrey,
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    backgroundColor: Colors.grey,
                  ) : TextButton.styleFrom(
                    //padding: const EdgeInsets.symmetric(vertical: 10),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: isDisabled ? null : () {
                      FirebaseAuth.instance.currentUser.updatePassword(newPass0);
                      Navigator.pop(context);
                  },
                  child: const Text("Register"),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
