import 'dart:ui';

enum ButtonType {
  number,
  operation,
  function,
  memory,
  utility,
}

class CalculatorButton {
  final String text;
  final String value;
  final ButtonType type;
  final Color? color;
  final Color? textColor;

  const CalculatorButton({
    required this.text,
    required this.value,
    required this.type,
    this.color,
    this.textColor,
  });
}