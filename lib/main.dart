import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black87,
                Colors.deepPurple,
                Colors.deepPurpleAccent
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Quiz(),
        ),
      ),
    );
  }
}

