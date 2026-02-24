import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/colors.dart';
import 'package:pokedex/pages/details/detail.page.dart';
import 'package:pokedex/pages/home/stores/home.store.dart';
import 'package:pokedex/pages/home/widgets/poke_card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store.loadPokemons();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      store.loadPokemons();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pokédex",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Proure um pokemon pelo nome ou pelo identificador",
                style: TextStyle(color: primaryColor, fontSize: 18),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Nome ou identificador",
                  hintStyle: const TextStyle(color: primaryColor),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.search, color: primaryColor),
                ),
                onChanged: store.setSearch,
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (context) {
                  return Expanded(
                    child: GridView.builder(
                      controller: scrollController,
                      itemCount: store.filteredPokes.length + 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.8,
                          ),
                      itemBuilder: (context, index) {
                        if (index < store.filteredPokes.length) {
                          final pokemon = store.filteredPokes[index];

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      DetailPage(pokemon: pokemon),
                                ),
                              );
                            },
                            child: PokeCard(pokemon: pokemon, store: store),
                          );
                        }

                        return store.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : Container();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
