import 'package:flutter/material.dart';
import 'package:personal_profile/week_2/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Calculator',
        home: CalculatorScreen(),
    );
  }
}
