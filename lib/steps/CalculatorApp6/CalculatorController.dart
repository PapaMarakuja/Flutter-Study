import 'package:calculator/steps/CalculatorApp6/CalculatorModel.dart';

class CalculatorController {
  CalculatorModel model = CalculatorModel();
  late Function() updateView;

  buttonPressed(String buttonText) {
    model.buttonPressed(buttonText);

    updateView();
  }

  double get getNum1 => model.num1;
  double get getNum2 => model.num2;
  String get getOperand => model.operand;
  String get getOutput => model.output;
}
