// @dart=2.9

import 'dart:math';

import 'package:app/module/myprofile/bmiCalculatorScreen.dart';
import 'package:app/module/myprofile/chart.dart';
import 'package:app/widget/drawer.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';



class MyProfilePage  extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
  static const String routeName = '/myprofile';

}
final data = [20.0,10.0,50.0,90.0,40.0,10.0,20.0,50.0];
  class _MyProfilePageState extends State<MyProfilePage>{


  var weight  = "0";
  var target = "0";
  String name = "Name";


  @override
  void initSate(){

  }

  Future<String> createAlertDialog(BuildContext context){

    TextEditingController myController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Value"),
        content: TextField(
          controller: myController,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text('Save'),
            onPressed: () {
              Navigator.of(context).pop(myController.text.toString());
            },
          )
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      drawer: SideDrawer(),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.yellow, Colors.amber]
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 250.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[

                      SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                        style:TextButton.styleFrom(
                          primary: Colors.black,
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          )
                        ),
                        onPressed: (){
                          createAlertDialog(context).then((value){
                            setState(() {
                              name = value;
                            });
                          });
                        },

                        child: Text(name),

                      ),

                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(

                                  children: <Widget>[
                                    Text(
                                      "Weight",
                                      style: TextStyle(
                                        color: Colors.amberAccent[700],
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    TextButton(
                                      style:TextButton.styleFrom(
                                          primary: Colors.black,
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20
                                          )
                                      ),

                                      onPressed: (){
                                        createAlertDialog(context).then((value){
                                          setState(() {
                                            weight = value;
                                          });
                                        });
                                      },
                                      child: Text(weight),

                                    )

                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(

                                  children: <Widget>[
                                    Text(
                                      "Target",
                                      style: TextStyle(
                                        color: Colors.amberAccent[700],
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    TextButton(
                                      style:TextButton.styleFrom(
                                          primary: Colors.black,
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20
                                          )
                                      ),
                                      onPressed: (){
                                        createAlertDialog(context).then((value){
                                          setState(() {
                                            target = value;
                                          });
                                        });
                                      },
                                      child: Text(target),

                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(
                    height: 10.0,
                  ),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Container(
            width: 250.00,

            child: RaisedButton(
                onPressed: (){
                  Navigator.push(context , MaterialPageRoute(
                      builder: (context) => bmiCalculatorScreen()
                  ));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.yellow,Colors.amber]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text("BMİ Calculator",
                      style: TextStyle(color: Colors.black, fontSize: 26.0, fontWeight:FontWeight.bold),
                    ),
                  ),
                ),
            ),
          ),


                SizedBox(
                  height: 20.0,
                ),
                ClayContainer(
                  height: 200,
                  width: 500,
                  depth: 12,
                  spread: 12,
                  borderRadius: 16,
                  child: Chart(
                    data: data,
                  ),
                )
        ],

      ),
    );
  }
}

