import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  CalculadoraState createState() => CalculadoraState();
}

class CalculadoraState extends State<Calculadora> {
  Color bgColor = Colors.green;
  int random = 0;

  void changeColor() {
    setState(() {
      bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      random = Random().nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: GestureDetector(
        onTap: () => changeColor(),
        child: Container(
            alignment: Alignment.center,
            child: Text(
              random.toString(),
              style: const TextStyle(
                  fontSize: 24.0, backgroundColor: Colors.black26),
            )),
      ),
    );
  }
}
