class Carro {
  String cor;
  String modelo;
  int velocidade;
  int qtdPortas;
  bool andando;

  Carro({
    required this.modelo,
    required this.cor,
    int? velocidade,
    int? qtdPortas
  }) : velocidade = velocidade ?? 100,
        qtdPortas = qtdPortas ?? 2,
        andando = false;

}