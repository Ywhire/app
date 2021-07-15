import 'package:app/module/myprofile/bmiModel.dart';
import 'package:app/module/myprofile/resultScreen.dart';
import 'package:flutter/material.dart';

class bmiCalculatorScreen extends StatefulWidget {
  @override
  _bmiCalculatorScreenState createState() => _bmiCalculatorScreenState();
}

class _bmiCalculatorScreenState extends State<bmiCalculatorScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;

  double _bmi = 0;

  bmiModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Text("BMI Calculator", style: TextStyle(color: Colors.amber, fontSize: 34, fontWeight: FontWeight.w700),),

              SizedBox(
                height: 32,
              ),

              Text("Height (cm)", style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 80.0,
                  max: 250.0,
                  onChanged: (height){
                    setState(() {
                      _heightOfUser = height;
                    });
                  },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.amber,
                  label: "$_heightOfUser",
                ),
              ),

              Text("$_heightOfUser cm", style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 24,),

              Text("Weight (kg)", style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30.0,
                  max: 120.0,
                  onChanged: (height){
                    setState(() {
                      _weightOfUser = height;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.amber,
                  label: "$_weightOfUser",
                ),
              ),

              Text("$_weightOfUser kg", style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 16,),

              Container(
                child: FlatButton.icon(
                  onPressed: (){
                    setState(() {
                      _bmi = _weightOfUser/((_heightOfUser/100)*(_heightOfUser/100));

                      if(_bmi >= 18.5 && _bmi <= 25){
                        _bmiModel = bmiModel(bmi: _bmi, isNormal: true, comments: "You are Totaly Fit");
                      }else if(_bmi < 18.5){
                        _bmiModel = bmiModel(bmi: _bmi, isNormal: false, comments: "You are Underweighted");
                      }else if(_bmi > 25 && _bmi <= 30){
                        _bmiModel = bmiModel(bmi: _bmi, isNormal: false, comments: "You are Overweighted");
                      }else{
                        _bmiModel = bmiModel(bmi: _bmi, isNormal: false, comments: "You are Obesed");
                      }
                    });

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => resultScreen(bmiModel: _bmiModel,)
                    ));
                  },
                  icon: Icon(Icons.favorite, color: Colors.white,),
                  label: Text("CALCULATE"),
                  textColor: Colors.white,
                  color: Colors.amber,

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        ),
      ),
    );
  }
}