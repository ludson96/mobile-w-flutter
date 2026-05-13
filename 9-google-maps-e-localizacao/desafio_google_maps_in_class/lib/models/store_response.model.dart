class StoreResponse {
  final int id;
  final String nome;
  final double latitude;
  final double longitude;

  StoreResponse({
    required this.id,
    required this.nome,
    required this.latitude,
    required this.longitude,
  });

  factory StoreResponse.fromMap(Map<String, dynamic> data) {
    return StoreResponse(
      id: data["id"],
      nome: data["nome"],
      latitude: data["latitude"],
      longitude: data["longitude"],
    );
  }
}
