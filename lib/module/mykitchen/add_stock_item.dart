import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:app/module/foodsearchmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'food_details_add_page.dart';

class AddStockItem extends StatefulWidget {

  @override
  _AddStockItemState createState() => _AddStockItemState();
}

class _AddStockItemState extends State<AddStockItem> {
  TextEditingController myController = TextEditingController();

  FoodData foodData;
  bool loading = true;
  List<String> _searchList = [];

  Future<void> showResults(String value) async{
    var url = "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=aNQ649BoLEb3xRcH1J7JwPikv8rlqkLkgXmO1nL0&query=$value&dataType=Survey%20(FNDDS)";
    var response = await http.get(url);
    var decodedResponse = convert.jsonDecode(response.body);
    foodData = FoodData.fromMap(decodedResponse);
    log(foodData.foods.length.toString());
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Add Items to Kitchen"),
        ),
        body: Column(
            children: [
              TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintMaxLines: 1,
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    )
                  ),
                  controller: myController,
                  onChanged: (value) {
                    showResults(value);
                    },
              ),
              Expanded(
                child: loading ? Center(child: CircularProgressIndicator()): ListView.builder(

                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: foodData == null?0:foodData.foods.length,
                    itemBuilder: (context, index) {
                      return InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsAddScreen(foodData.foods[index].fdcId)));
                      },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${foodData.foods[index].description}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    foodData.foods[index].brandName == null?
                                        Text(""): Text(
                                      "${foodData.foods[index].brandName}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),

    ]
    )
    );
  }


}