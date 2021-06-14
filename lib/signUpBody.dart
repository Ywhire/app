import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign Up",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
