import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemon_details.model.dart';
import 'package:pokedex/services/poke_api.services.dart';

part 'detail.store.g.dart';

class DetailStore = DetailStoreBase with _$DetailStore;

abstract class DetailStoreBase with Store {
  final _service = PokeApiService();

  @observable
  bool isLoading = false;

  @observable
  PokemonDetails? pokemonDetails;

  @action
  Future<void> getPokemonDetailsData(String nameOrId) async {
    isLoading = true;

    final pokemon = await _service.getPokemonDetail(nameOrId);

    pokemonDetails = pokemon;

    isLoading = false;
  }
}
