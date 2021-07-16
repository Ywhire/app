import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  final bmiModel;

  resultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                height: 8,
              ),
              Text("Your BMI is ${bmiModel.bmi.round()}", style: TextStyle(color: Colors.lightGreen[300], fontSize: 34, fontWeight: FontWeight.w700),),
              Text("${bmiModel.comments}", style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),),

              SizedBox(height: 16,),

              bmiModel.isNormal ?
              Text(" Your BMI is Normal.", style: TextStyle(color: Colors.lightGreen[300], fontSize: 18, fontWeight: FontWeight.w700),)
                  :
              Text(" Your BMI is not Normal.", style: TextStyle(color: Colors.lightGreen[300], fontSize: 18, fontWeight: FontWeight.w700),),
              SizedBox(height: 16,),

              Container(
                child: FlatButton.icon(
                  onPressed: (){

                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  label: Text(" CALCULATE AGAIN"),
                  textColor: Colors.white,
                  color: Colors.lightGreen[300],

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        )
    );
  }
}