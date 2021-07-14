import 'package:app/buttons.dart';
import 'package:app/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        drawer: SideDrawer(),
        body: Center(

        child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Row(
                children: <Widget>[
                  SizedBox(height: 100),
                  ElevatedButton(
                    child: Text('Change Profile'),
                    onPressed: (){Navigator.push(context , MaterialPageRoute(
                        builder: (context) => LoginPage()
                    ));
                    },
                    style: ElevatedButton.styleFrom(
                        primary:  Colors.amber,
                      side: BorderSide(width: 3,color: Colors.amberAccent),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                        padding: EdgeInsets.all(30),
                    ),

                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

              ),
                Row(
                  children: <Widget>[
                    SizedBox(height: 100),

                    ElevatedButton(
                        child: Text('Notification'),
                      onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary:  Colors.amber,
                      side: BorderSide(width: 3,color: Colors.amberAccent),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      padding: EdgeInsets.all(30),

                    ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),

                Row(
                  children: <Widget>[
                    SizedBox(height: 100),

                    ElevatedButton(
                      child: Text('Quit Account'),
                      onPressed: (){
                        Navigator.push(context , MaterialPageRoute(
                            builder: (context) => LoginPage()
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          primary:  Colors.amber,
                        side: BorderSide(width: 3,color: Colors.amberAccent),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        padding: EdgeInsets.all(30),
                      ),),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
        )
    );
  }
}