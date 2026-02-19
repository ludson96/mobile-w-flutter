import 'package:flutter/material.dart';
import 'package:pokedex/colors.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("src", height: 130),
          const SizedBox(height: 15),
          const Text(
            "Bulbasaur",
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "001",
            style: TextStyle(color: primaryColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
