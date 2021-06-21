import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';
import 'package:app/module/mykitchen/add_stock_item.dart';
import 'package:app/module/mykitchen/stock_data.dart';

class MyKitchenPage extends StatelessWidget {
  static const String routeName = '/mykitchen';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("My Kitchen"),
      ),
      drawer: SideDrawer(),
      body: StockList(mystock),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStockItem()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}

class StockList extends StatelessWidget {

  final List<Stock> _mystock;

  StockList(this._mystock);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: _buildStockList()
    );
  }

  List<_StockListItem> _buildStockList() {
    return _mystock.map((Stock) => _StockListItem(Stock))
        .toList();
  }

}

class _StockListItem extends ListTile {

  _StockListItem(Stock stock) :
        super(
          title: Text(stock.ingredientname),
          subtitle: Text(stock.ingredientamount)
      );
}

