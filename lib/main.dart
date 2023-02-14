import 'package:flutter/material.dart';
import 'package:simplequiz/HomePage.dart';
import 'quizscreen.dart';
// import 'quizscreen.dart '

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: quizscreen(),
    );
  }
}
