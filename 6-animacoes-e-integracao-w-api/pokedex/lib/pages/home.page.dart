import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [Align(alignment: AlignmentGeometry.topLeft,
        child: Text("Pokedex", style: TextStyle(),),)]),
      ),
    );
  }
}
