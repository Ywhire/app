import 'package:app/module/mykitchen/food_details_page.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/drawer.dart';
import 'package:app/module/mykitchen/add_stock_item.dart';
import 'package:app/module/mykitchen/stock_data.dart';

class MyKitchenPage extends StatefulWidget {
  static const String routeName = '/mykitchen';

  @override
  _MyKitchenPageState createState() => _MyKitchenPageState();
}

class _MyKitchenPageState extends State<MyKitchenPage> {
  var stockList = Stock();
  List<Stock> _stockList = [];
  @override
  void initState() {
    _stockList = stockList.stockList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("My Kitchen"),
      ),
      drawer: SideDrawer(),
      body: ListView.builder(
          itemCount: _stockList.length,
          itemBuilder: (context, index) {
        return InkWell(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsScreen(_stockList[index].id, _stockList[index].ingredientamount)));
        },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_stockList[index].ingredientname}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${_stockList[index].ingredientcategory}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "${_stockList[index].ingredientamount}g",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        );
      }),
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

/*StockList(mystock),

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

*/
