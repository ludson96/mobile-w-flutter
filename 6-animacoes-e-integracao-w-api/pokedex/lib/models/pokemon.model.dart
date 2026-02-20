class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});

  factory Pokemon.fromMap(Map<String, dynamic> data) {
    return Pokemon(name: data["name"], url: data["url"]);
  }

  String get id {
    final data = url.split("/");
    data.removeLast();
    return data.last;
  }
}
