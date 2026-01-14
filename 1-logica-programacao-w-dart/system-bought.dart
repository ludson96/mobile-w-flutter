import 'dart:io';

void main() {
  final products = <Map<String, dynamic>>[];
  bool isRunning = true;

  while (isRunning) {
    print("Escolha uma das seguintes opções do menu:");
    print("[1] - Cadastrar produto");
    print("[2] - Listar produtos");
    print("[3] - Remover produto");
    print("[4] - Finalizar compra");

    final option = stdin.readLineSync();

    switch (option) {
      case "1":
        registerProduct(products: products);
        break;
      case "2":
        listProducts(products: products);
        break;
      case "3":
        removeProduct(products: products);
        break;
      case "4":
        finishSystem(products: products);
        isRunning = false;
        break;
      default:
    }
  }
}

void registerProduct({required List products}) {
  stdout.write("Digite o nome do produto: ");
  final productName = stdin.readLineSync();

  final foundProducts = products.firstWhere(
    (product) => product["name"] == productName,
    orElse: () => {"name": false},
  );

  stdout.write("Digite o quantidade do produto: ");
  final productAmount = int.parse(stdin.readLineSync()!);

  if (foundProducts["name"] != false) {
    foundProducts["amount"] += productAmount;
    return;
  }

  stdout.write("Digite o valor do produto: ");
  final productValue = double.parse(stdin.readLineSync()!);

  products.add({
    "name": productName,
    "value": productValue,
    "amount": productAmount,
  });
}

void listProducts({required List products}) {
  products.forEach((product) {
    print("""
              Nome: ${product["name"]},
              Valor: R\$ ${(product["value"] as double).toStringAsFixed(2)},
              Quantidade: ${product["amount"]},
        =========================================
      """);
  });
}

void removeProduct({required List products}) {
  stdout.write("Digite o nome do produto a ser removido: ");
  final nameProduct = stdin.readLineSync();

  final foundProducts = products.firstWhere(
    (product) => product["name"] == nameProduct,
    orElse: () => {"name": false},
  );

  bool isRemoved = products.remove(foundProducts);

  print("teste: $isRemoved");

  if (isRemoved) {
    print("Produto removido com sucesso.");
  } else {
    print("Produto não encontrado.");
  }
}

void finishSystem({required List products}) {
  listProducts(products: products);

  double totalPay = 0;

  products.forEach(
    (product) => totalPay += product["amount"] * product["value"],
  );

  print("Total a pagar: R\$ ${totalPay.toStringAsFixed(2)}");
}

class Carro {
  String cor;
  String modelo;
  int? velocidade;
  int? qtdPortas;
  bool andando;

  Carro({
    required this.modelo,
    required this.cor,
    int? velocidade,
    int? qtdPortas
  }) : velocidade = velocidade ?? 100

}