import 'package:app/loginPage.dart';
import 'package:app/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:app/module/welcome/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome \nto the \nDiet Master",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.orangeAccent),
            ),
            SizedBox(
              height: size.height * 0.3,
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
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text("Login"),
                ),
              ),
            ),
            Container(
              // Sign up Button
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
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: const Text("Register"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
