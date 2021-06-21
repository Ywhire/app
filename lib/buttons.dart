import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PlusButton extends StatelessWidget {
  final Function press;
  const PlusButton({Key key, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Icon(Icons.add, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: Colors.amber,
      ),
    );
  }
}

class RectanText extends StatelessWidget {
  final String text;
  final Color color;
  final Function press;
  const RectanText(
      {Key key, @required this.text, @required this.color, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      width: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // How much circularity we want
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.black,
            textStyle: const TextStyle(fontSize: 20),
            backgroundColor: color,
          ),
          onPressed: press,
          child: Text(text),
        ),
      ),
    );
  }
}
