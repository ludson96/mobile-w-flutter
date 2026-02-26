import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/colors.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/pages/details/stores/detail.store.dart';
import 'package:pokedex/pages/details/widgets/characteristc.widget.dart';
import 'package:pokedex/pages/details/widgets/percentage_indicator.widget.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  final DetailStore store = DetailStore();

  DetailPage({super.key, required this.pokemon}) {
    store.getPokemonDetailsData(pokemon.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: pokemon.color,
            pinned: false,
            floating: true,
            collapsedHeight: 60,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: ValueKey(pokemon.id),
                child: CachedNetworkImage(imageUrl: pokemon.imageUrl),
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return store.isLoading
                  ? const SliverToBoxAdapter(child: LinearProgressIndicator())
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Text(
                              store.pokemonDetails!.name.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "#${store.pokemonDetails!.id}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Wrap(
                              spacing: 10,
                              children:
                                  store.pokemonDetails?.types
                                      ?.map(
                                        (type) => Chip(
                                          label: Text(type.type.name),
                                          backgroundColor: pokemon.color,
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Characteristc(
                                  value: store.pokemonDetails!.height
                                      .toString(),
                                  name: "Height",
                                ),
                                Characteristc(
                                  value: store.pokemonDetails!.baseExperience
                                      .toString(),
                                  name: "Experience",
                                ),
                                Characteristc(
                                  value: store.pokemonDetails!.weight
                                      .toString(),
                                  name: "Weight",
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Stats",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            const Divider(),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount:
                                  store.pokemonDetails?.stats?.length ?? 0,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, index) {
                                final stat =
                                    store.pokemonDetails!.stats![index];
                                return PercentageIndicator(
                                  name: stat.stat.name,
                                  value: stat.baseStat,
                                  color: pokemon.color,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
