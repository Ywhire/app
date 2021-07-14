import 'dart:developer';

import 'package:app/authenticaiton.dart';
import 'package:app/module/calendar/calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/routes/Routes.dart';
import 'package:app/module/home/homePage.dart';
import 'package:app/module/welcome/welcomePage.dart';
import 'package:app/module/myprofile/my_profile_page.dart';

import 'package:app/module/mykitchen/my_kitchen_page.dart';
import 'package:app/module/settings/settings_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      create: (_) => Authentication().user,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.amber,
        ),
        home: Wrapper(),
        routes: {
          Routes.home: (context) => HomePage(),
          Routes.myprofile: (context) => MyProfilePage(),
          Routes.mykitchen: (context) => MyKitchenPage(),
          Routes.calendar: (context) => Calendar(),
          Routes.settings: (context) => SettingsPage(),
        },
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User>(context);
    log("Heloo1");
    if (firebaseUser != null) {
      log("Heloo2");
      return HomePage();
    }
    log("Heloo3");
    return WelcomePage();
  }
}
