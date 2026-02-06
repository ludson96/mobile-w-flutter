import 'package:flutter/material.dart';
import 'package:lista_de_compras/widgets/add_list.widget.dart';
import 'package:lista_de_compras/widgets/empty_list.widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void addList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddList(),
        fullscreenDialog: true,
      ),
    );
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: addList,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
