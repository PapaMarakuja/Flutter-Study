import 'dart:ffi';
import 'package:flutter/material.dart';

class CalculatorApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  buttonPressed(String buttonText) {
    if (_output == '0' && buttonText == '0') {
      return;
    }

    if (buttonText == 'C') {
      _output = '';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (['+', '-', '÷', '×'].any((x) => x == buttonText)) {
      num1 = _output.isNotEmpty
          ? double.parse(_output)
          : num1 > 0
              ? num1
              : 0;
      operand = buttonText;
      _output = '';
    } else if (buttonText == '=') {
      switch (operand) {
        case '+':
          _output = (num1 + num2).ceil().toString();
          break;
        case '-':
          _output = (num1 - num2).ceil().toString();
          break;
        case '÷':
          _output = (num1 / num2).ceil().toString();
          break;
        case '×':
          _output = (num1 * num2).ceil().toString();
          break;
      }
      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      if (operand != '') {
        num2 = double.parse(num2.ceil().toString() + buttonText);
      }

      _output = _output == '0' ? buttonText : _output + buttonText;
    }

    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton(
          onPressed: () {
            buttonPressed(buttonText);
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(
                    fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                      buildButton('÷'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                      buildButton('×'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                      buildButton('-'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('C'),
                      buildButton('0'),
                      buildButton('='),
                      buildButton('+'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
