import 'package:calculator/steps/CalculatorApp6/CalculatorController.dart';
import 'package:calculator/steps/CalculatorApp6/components/outlinedButton.dart';
import 'package:flutter/material.dart';

class CalculatorApp6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final CalculatorController controller = CalculatorController();
  @override
  Widget build(BuildContext context) {
    controller.updateView = () {
      setState(() {});
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                '${controller.getNum1 != 0 ? controller.getNum1 : ''} ${controller.getOperand.isNotEmpty ? controller.getOperand : ''} ${controller.getNum2 != 0 ? controller.getNum2 : ''} ',
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                controller.getOutput,
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
                      buildButton('C', controller.buttonPressed),
                      buildButton('+/-', controller.buttonPressed),
                      buildButton('%', controller.buttonPressed),
                      buildButton('÷', controller.buttonPressed),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('7', controller.buttonPressed),
                      buildButton('8', controller.buttonPressed),
                      buildButton('9', controller.buttonPressed),
                      buildButton('×', controller.buttonPressed),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('4', controller.buttonPressed),
                      buildButton('5', controller.buttonPressed),
                      buildButton('6', controller.buttonPressed),
                      buildButton('-', controller.buttonPressed),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('1', controller.buttonPressed),
                      buildButton('2', controller.buttonPressed),
                      buildButton('3', controller.buttonPressed),
                      buildButton('+', controller.buttonPressed),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      buildButton('0', controller.buttonPressed),
                      buildButton('.', controller.buttonPressed),
                      buildButton('=', controller.buttonPressed),
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
