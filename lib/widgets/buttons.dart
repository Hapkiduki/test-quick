import 'package:flutter/material.dart';

class Buttons {
  Widget circularButton({
    @required VoidCallback onPressed,
    @required String text,
    Color color = Colors.blue,
    Color textColor = Colors.white,
  }) =>
      RaisedButton(
        elevation: 2,
        highlightElevation: 5,
        color: color,
        shape: StadiumBorder(),
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(text, style: TextStyle(color: textColor, fontSize: 17)),
          ),
        ),
      );
}

Buttons buttons = Buttons();
