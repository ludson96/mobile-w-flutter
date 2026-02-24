import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:pokedex/colors.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/pages/home/stores/home.store.dart';

class PokeCard extends StatefulWidget {
  final Pokemon pokemon;
  final HomeStore store;

  const PokeCard({super.key, required this.pokemon, required this.store});

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _extractColor();
  }

  Future<void> _extractColor() async {
    try {
      final palette = await PaletteGeneratorMaster.fromImageProvider(
        NetworkImage(widget.pokemon.imageUrl),
      );

      if (mounted && palette.dominantColor != null) {
        widget.store.updatePokemonColor(
          pokemonId: widget.pokemon.id,
          color: palette.dominantColor!.color,
        );
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: widget.pokemon.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: ValueKey(widget.pokemon.id),
              child: CachedNetworkImage(
                imageUrl: widget.pokemon.imageUrl,
                height: 130,
              ),
            ),

            const SizedBox(height: 15),
            Text(
              widget.pokemon.name,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.pokemon.id.padLeft(4, '0'),
              style: const TextStyle(color: primaryColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
