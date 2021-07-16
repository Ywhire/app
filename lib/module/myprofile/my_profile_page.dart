import 'package:app/module/myprofile/bmiCalculatorScreen.dart';
import 'package:app/module/myprofile/chart.dart';
import 'package:app/widget/drawer.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyProfilePage  extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
  static const String routeName = '/myprofile';
}

final data = [20.0,10.0,50.0,90.0,40.0,10.0,20.0,50.0];

class _MyProfilePageState extends State<MyProfilePage>{
  bool loading = true;

  String weight;

  var target = "0";
  String uId;
  String name;
  String surname;
  int age;


  Future<void> fetchData() async{
    setState(() {
      uId = FirebaseAuth.instance.currentUser.uid;
    });
    fetchInfo();
  }


  Future<void> fetchInfo() async {

    var document  = FirebaseFirestore.instance.collection('users').doc(uId);

    var a = await document.get();
    var documentData = a.data();
    var uname = documentData['name'];
    var usurname = documentData['surname'];
    var uweight = documentData['weight'];
    var uage = documentData['age'];

    setState(() {
      name = uname;
      surname = usurname;
      age = uage;
      weight = uweight.toString();
      loading = false;
    });

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

  Future<void> initializeFlutterFire() async {
    await Firebase.initializeApp();
  }

  @override
  void initState(){
    initializeFlutterFire();
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      drawer: SideDrawer(),
      body: loading ? Center(child: CircularProgressIndicator()): Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.yellow, Colors.lightGreen[300]]
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 220.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("${name} ${surname}, ${age.toString()}" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 15,),
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
                                        color: Colors.lightGreenAccent[700],
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
                                          if(value != null){
                                            setState(() {
                                              weight = value;
                                            });
                                          }
                                        });
                                      },
                                      child: Text(weight.toString()),
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
                                        color: Colors.lightGreenAccent[700],
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
                                          if(value != null) {
                                            setState(() {
                                              target = value;
                                            });
                                          }
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
          SizedBox(height: 30,),
          ClayContainer(
                  height: 250,
                  width: 350,
                  depth: 12,
                  spread: 12,
                  borderRadius: 16,
                  child: Chart(
                    data: data,
                  ),
          ),
          SizedBox(height: 30.0,),
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
                      colors: [Colors.yellow,Colors.lightGreen[300]]
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text("BMI Calculator",
                    style: TextStyle(color: Colors.black, fontSize: 26.0, fontWeight:FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],

      ),
    );
  }
}

