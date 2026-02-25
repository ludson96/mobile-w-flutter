import 'package:pokedex/models/pokemon_type.model.dart';

class Type {
  final int slot;
  final PokemonType type;

  Type({required this.slot, required this.type});

  factory Type.fromMap(Map<String, dynamic> data) {
    return Type(slot: data["slot"], type: PokemonType.fromMap(data["type"]));
  }
}
