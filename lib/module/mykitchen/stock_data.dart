class Stock {
  final int id;
  final String ingredientname;
  final String ingredientcategory;
  final int ingredientamount;

  const Stock({this.id, this.ingredientname, this.ingredientcategory, this.ingredientamount});

  List<Stock> stockList() {
    return [
      Stock(
          id: 1102644,
          ingredientname: 'Apple',
          ingredientcategory: 'Fruit',
          ingredientamount: 1000
      ),
      Stock(
          id: 1101825 ,
          ingredientname: 'Oats',
          ingredientcategory: 'Fruit',
          ingredientamount: 1000
      ),
      Stock(
          id: 1102644,
          ingredientname: 'Tomato',
          ingredientcategory: 'Fruit',
          ingredientamount: 500
      ),
      Stock(
          id: 1102653 ,
          ingredientname: 'Banana',
          ingredientcategory: 'Fruit',
          ingredientamount: 200
      ),
      Stock(
          id: 1102653 ,
          ingredientname: 'Banana',
          ingredientcategory: 'Fruit',
          ingredientamount: 2
      ),
    ];
  }
}
