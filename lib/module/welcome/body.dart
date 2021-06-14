import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/body.dart
import 'signUpPage.dart';
import 'package:app/background.dart';
import 'package:app/homePage.dart';
=======
import 'package:app/module/welcome/background.dart';
import 'package:app/module/home/homePage.dart';
>>>>>>> daedf4afcdc122845a13b20fe6ae81ffc445aa9e:lib/module/welcome/body.dart

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome to the App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: size.height * 0.6,
          ),
          Container(
            // Login button
            margin: EdgeInsets.symmetric(vertical: 20.0),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(29), // How much circularity we want
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.lightGreen,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: const Text("LOGIN"),
              ),
            ),
          ),
          Container(
            // Sign up Button
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: const Text("SIGN UP"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
