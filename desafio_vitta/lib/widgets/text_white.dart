import 'package:flutter/material.dart';

class TextWhite extends StatelessWidget {

  String text;
  double size;
  TextWhite(this.text, {this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: Colors.white,
      ),
    );
  }
}
