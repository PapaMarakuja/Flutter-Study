class CalculatorModel {
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  String output = '';

  String calculateResult(double num1, double num2, String operand) {
    double? result = 0;
    switch (operand) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '×':
        result = num1 * num2;
        break;
      case '÷':
        result = num1 / num2;
        break;
      default:
        result = null;
        break;
    }
    return result != null ? result.toString() : '';
  }

  void buttonPressed(buttonText) {
    switch (buttonText) {
      case 'C':
        output = '';
        num1 = 0;
        num2 = 0;
        operand = '';
        break;
      case '+/-':
        output = ((double.tryParse(output) ?? 0.0) * -1).toString();
        break;
      case '+':
      case '-':
      case '×':
      case '÷':
        if (operand != '') {
          num2 = double.tryParse(output) ?? 0.0;
          output = calculateResult(num1, num2, operand);
        } else {
          num1 = double.tryParse(output) ?? 0.0;
          operand = buttonText;
          output = '';
        }
        break;
      case '=':
        num2 = double.tryParse(output) ?? 0.0;
        output = calculateResult(num1, num2, operand);
        break;
      case '%':
        // TODO
        break;
      default:
        if (num1 != 0 && num2 != 0 && operand != '') {
          output = '';
          num1 = 0;
          num2 = 0;
          operand = '';
        }

        output += buttonText;
        break;
    }
  }
}
