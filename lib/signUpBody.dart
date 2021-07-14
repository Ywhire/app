import 'package:flutter/material.dart';
import 'package:app/module/home/homePage.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
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
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
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
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: const Text("Register"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
