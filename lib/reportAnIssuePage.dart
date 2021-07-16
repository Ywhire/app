import 'package:app/buttons.dart';
import 'package:app/loginPage.dart';
import 'package:app/module/settings/change_password_page.dart';
import 'package:app/module/settings/edit_profile_page.dart';
import 'package:app/module/welcome/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';


class ReportIssuePage extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {


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
          title: Text("Report an Issue"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Subject",
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Type your message here.",
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.lightGreen[300],
                    ),
                    onPressed: () {
                          Navigator.pop(context);
                    },
                    child: const Text("Send"),
                  ),
                ),
              ),
          ],
        ),
    )
    );
  }
}