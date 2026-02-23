import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final String url;
  final Color color;

  Pokemon({required this.name, required this.url, this.color = Colors.white});

  factory Pokemon.fromMap(Map<String, dynamic> data) {
    return Pokemon(name: data["name"], url: data["url"]);
  }

  String get id {
    final data = url.split("/");
    data.removeLast();
    return data.last;
  }

  String get imageUrl =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";

  Pokemon copyWith({String? name, String? url, Color? color}) {
    return Pokemon(
      name: name ?? this.name,
      url: url ?? this.url,
      color: color ?? this.color,
    );
  }
}
