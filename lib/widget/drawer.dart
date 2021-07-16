import 'package:app/reportAnIssuePage.dart';
import 'package:flutter/material.dart';
import 'package:app/routes/Routes.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
          _createDrawerItem(
              icon: Icons.account_box,
              text: 'Profile',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.myprofile)),
          _createDrawerItem(
              icon: Icons.kitchen,
              text: 'My Kitchen',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.mykitchen)),/*
          _createDrawerItem(
              icon: Icons.calendar_today,
              text: 'Calendar',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.calendar)),*/
          _createDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.settings)),
          Divider(),
          _createDrawerItem(
              icon: Icons.bug_report,
              text: 'Report an issue',
              onTap: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReportIssuePage()))),
          ListTile(
            title: Text('v0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.lightGreen[300],

        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Diet Master",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500)
              )
          ),
        ]
        )
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}