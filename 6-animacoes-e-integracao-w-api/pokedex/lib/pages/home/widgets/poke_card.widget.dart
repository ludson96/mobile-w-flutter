import 'package:flutter/material.dart';
import 'package:pokedex/colors.dart';
import 'package:pokedex/models/pokemon.model.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokeCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(pokemon.url, height: 130),
          const SizedBox(height: 15),
          Text(
            pokemon.name,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "#${pokemon.id.padLeft(4, '0')}",
            style: const TextStyle(color: primaryColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
