import 'package:flutter/material.dart';
import 'bmi_calculator.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red,
          appBarTheme: AppBarTheme(
            color: Colors.purple,
            centerTitle: true,
          ),
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white))),
      home:BmiCalculator(),
    );
  }
}