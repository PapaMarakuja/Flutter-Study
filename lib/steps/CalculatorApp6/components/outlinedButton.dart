import 'package:flutter/material.dart';

Widget buildButton(String buttonText, Function onPressed) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: OutlinedButton(
        onPressed: () {
          onPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
    ),
  );
}
