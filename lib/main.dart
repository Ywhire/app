import 'package:flutter/material.dart';
<<<<<<< HEAD
import "package:app/welcomePage.dart";
=======
import 'package:app/routes/Routes.dart';
import 'package:app/module/home/homePage.dart';
import 'package:app/module/welcome/welcomePage.dart';
import 'package:app/module/myprofile/my_profile_page.dart';
import 'package:app/module/calendar/calendar_page.dart';
import 'package:app/module/mykitchen/my_kitchen_page.dart';
import 'package:app/module/settings/settings_page.dart';
>>>>>>> daedf4afcdc122845a13b20fe6ae81ffc445aa9e

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
<<<<<<< HEAD
=======
      routes:  {
        Routes.home: (context) => HomePage(),
        Routes.myprofile: (context) => MyProfilePage(),
        Routes.mykitchen: (context) => MyKitchenPage(),
        Routes.calendar: (context) => CalendarPage(),
        Routes.settings: (context) => SettingsPage(),
      },
>>>>>>> daedf4afcdc122845a13b20fe6ae81ffc445aa9e
    );
  }
}
