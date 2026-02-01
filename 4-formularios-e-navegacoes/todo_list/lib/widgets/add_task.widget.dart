import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Adicionar tarefa",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
            ],
          ),
          const Divider(thickness: 2, height: 0),
          const SizedBox(height: 15),
          const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "O que você quer fazer hoje?",
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Adicionar informações",
            ),
          ),
          Row(
            children: [
              const Icon(Icons.sort),
              const SizedBox(width: 20),
              const Icon(Icons.star_border),
              const Spacer(), // Automaticamente ocupa todo o espaço em branco jogando o "Adicionar" para o lado direito
              TextButton(onPressed: () {}, child: const Text("Adicionar")),
            ],
          ),
        ],
      ),
    );
  }
}
