import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign Up",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Your Name",
                    icon: Icon(
                      Icons.person,
                      color: Colors.amber,
                    )),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Your Email",
                    icon: Icon(
                      Icons.mail,
                      color: Colors.amber,
                    )),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Your Password",
                    icon: Icon(
                      Icons.lock,
                      color: Colors.amber,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
