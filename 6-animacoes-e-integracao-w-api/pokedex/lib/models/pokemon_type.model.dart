class PokemonType {
  final String name;
  final String url;

  PokemonType({required this.name, required this.url});

  factory PokemonType.fromMap(Map<String, dynamic> data) {
    return PokemonType(name: data["name"], url: data["url"]);
  }
}
