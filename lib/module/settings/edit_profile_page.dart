import 'package:app/buttons.dart';
import 'package:app/loginPage.dart';
import 'package:app/module/settings/change_password_page.dart';
import 'package:app/module/welcome/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

import '../../authenticaiton.dart';

class EditProfilePage extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

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
          title: Text("Edit Profile"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(0, 9, 0, 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Height",style: TextStyle(fontWeight: FontWeight.w400),),
                    onTap: (){

                    },
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text("Sex",style: TextStyle(fontWeight: FontWeight.w400),),
                    onTap: (){

                    },
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text("Age",style: TextStyle(fontWeight: FontWeight.w400),),
                    onTap: (){

                    },
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text("Location",style: TextStyle(fontWeight: FontWeight.w400),),
                    onTap: (){

                    },
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text("Time Zone",style: TextStyle(fontWeight: FontWeight.w400),),
                    onTap: (){

                    },
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text("Goals",style: TextStyle(fontWeight: FontWeight.w400),),
                    onTap: () {

                    },
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}