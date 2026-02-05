import 'package:flutter/material.dart';
import 'package:lista_de_compras/widgets/empty_list.widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minhas listas",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.diamond_sharp, color: Colors.amber, size: 35),
          ),
        ],
      ),
      body: EmptyList(),
    );
  }
}
