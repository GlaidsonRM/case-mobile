import 'package:flutter/material.dart';

class TextGrey extends StatelessWidget {

  String text;
  double size;
  TextGrey(this.text, {this.size = 16});

  @override
  Widget build(BuildContext context) {
    return new Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Color(0xff7c8aba),
      ),
    );
  }
}
