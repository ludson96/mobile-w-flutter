class PokemonStat {
  final String name;
  final String url;

  PokemonStat({required this.name, required this.url});

  factory PokemonStat.fromMap(Map<String, dynamic> data) {
    return PokemonStat(name: data["name"], url: data["url"]);
  }
}
