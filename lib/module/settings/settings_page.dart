import 'package:app/buttons.dart';
import 'package:app/loginPage.dart';
import 'package:app/module/settings/change_password_page.dart';
import 'package:app/module/settings/edit_profile_page.dart';
import 'package:app/module/welcome/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

import '../../authenticaiton.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final Authentication _auth = Authentication();

  Future<void> initializeFlutterFire() async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        drawer: SideDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                child: Column(
                  children: [
                    Divider(
                      height: 0,
                      thickness: 9,
                    ),
                    ListTile(
                      title: Text("My Account",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                    ),/*
                    ListTile(
                      title: Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.w400),),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EditProfilePage()));
                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                    ),
                    ListTile(
                      title: Text("Goals",style: TextStyle(fontWeight: FontWeight.w400),),
                      onTap: (){

                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                    ),
                    ListTile(
                      title: Text("Delete Account",style: TextStyle(fontWeight: FontWeight.w400),),
                      onTap: (){

                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                    ),*/
                    ListTile(
                      title: Text("Change Password",style: TextStyle(fontWeight: FontWeight.w400),),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => changePasswordPage()));
                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                    ),
                    ListTile(
                      title: Text("Log Out",style: TextStyle(fontWeight: FontWeight.w400),),
                      onTap: () async {
                        await _auth.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => WelcomePage()));
                      },
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 10,
                margin: const EdgeInsets.fromLTRB(0, 1, 0, 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                child: Column(
                  children: [
                    Divider(
                      height: 0,
                      thickness: 8,
                    ),
                    ListTile(
                      title: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                    ),
                    ListTile(
                      title: Text("Reminders",style: TextStyle(fontWeight: FontWeight.w400),),
                      onTap: (){

                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                    ),
                    ListTile(
                      title: Text("Push Notifications",style: TextStyle(fontWeight: FontWeight.w400),),
                      onTap: (){

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}