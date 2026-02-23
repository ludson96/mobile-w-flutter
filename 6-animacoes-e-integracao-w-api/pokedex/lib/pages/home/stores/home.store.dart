import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/services/poke_api.services.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _service = PokeApiService();

  int offset = 0;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Pokemon> pokemons = <Pokemon>[].asObservable();

  @observable
  String? search;

  @computed
  List<Pokemon> get filteredPokes {
    if (search == null) return pokemons.toList();

    return pokemons.where((pokemon) => pokemon.name.contains(search!)).toList();
  }

  @action
  void setSearch(String? text) => search = text;

  @action
  Future<void> loadPokemons() async {
    isLoading = true;

    final pokeResponse = await _service.loadPokemons(offset: offset);

    offset += 20;
    pokemons.addAll(pokeResponse.results);

    isLoading = false;
  }

  @action
  void updatePokemonColor({required String pokemonId, required Color color}) {
    final indexPokemon = pokemons.indexWhere((poke) => poke.id == pokemonId);
    pokemons[indexPokemon] = pokemons[indexPokemon].copyWith(color: color);
  }
}
