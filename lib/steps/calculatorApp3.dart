import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '10';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Calculadora'),
      ),
      body: Column(
        children: [
          Text(
            _output,
            style: const TextStyle(fontSize: 25),
          ),
          numbersRow([
            '7',
            '8',
            '9',
          ]),
          numbersRow([
            '4',
            '5',
            '6',
          ]),
          numbersRow([
            '1',
            '2',
            '3',
          ]),
          numbersRow(['0', ','])
        ],
      ),
    );
  }
}

Row numbersRow(List<String> numbers) {
  return Row(
    children: [
      for (int i = 0; i < numbers.length; i++)
        Expanded(
            child: OutlinedButton(
                onPressed: () => {}, child: Text(numbers.elementAt(i)))),
    ],
  );
}
