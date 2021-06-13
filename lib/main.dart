import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.amber,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

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
                onPressed: () {},
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
<<<<<<< HEAD
          ),
=======
            onPressed: () {},
            child: const Text("LOGIN LOGIN"),
          )
>>>>>>> 3d32c12db514ebc3aaa18ab354b0b99914043835
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          child,
        ],
      ),
    );
  }
}
