import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/services/poke_api.services.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _service = PokeApiService();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Pokemon> pokemons = <Pokemon>[].asObservable();

  @action
  Future<void> loadPokemons() async {
    isLoading = true;

    final pokeResponse = await _service.loadPokemons();

    pokemons = pokeResponse.results.asObservable();

    isLoading = false;
  }
}
