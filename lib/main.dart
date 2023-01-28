import 'package:animated_app/screens/entry_point.dart';
import 'package:animated_app/screens/onBoarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const OnBoardingScreen(),
    );
  }
}
