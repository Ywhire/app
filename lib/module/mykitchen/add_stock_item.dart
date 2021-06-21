import 'package:flutter/material.dart';

class AddStockItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Add Items to Kitchen"),
        ),
        body: Center(child: Text("Add")));
  }
}