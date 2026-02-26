import 'package:flutter/material.dart';
import 'package:pokedex/colors.dart';

class Characteristc extends StatelessWidget {
  final String value;
  final String name;

  const Characteristc({super.key, required this.value, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(name)
      ],
    );
  }
}
