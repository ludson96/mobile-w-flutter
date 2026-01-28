import 'package:clone_home_medium/pages/home_medium.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clone home medium',
      theme: ThemeData(
        // Thi
        colorScheme: .fromSeed(seedColor: Colors.blue),
      ),
      home: HomeMediumPage(),
    );
  }
}
