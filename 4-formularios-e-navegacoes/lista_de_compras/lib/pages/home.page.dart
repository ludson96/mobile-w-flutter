import 'package:flutter/material.dart';
import 'package:lista_de_compras/model/item_list.model.dart';
import 'package:lista_de_compras/widgets/add_list.widget.dart';
import 'package:lista_de_compras/widgets/empty_list.widget.dart';
import 'package:lista_de_compras/widgets/shopping_list.widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ItemList> itemLists = [];

  void addList() async {
    final newItemList = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddList(),
        fullscreenDialog: true,
      ),
    );

    if (newItemList != null) {
      setState(() {
        itemLists.add(newItemList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minhas listas",
          key: Key("appBarTitle"),
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
      body: itemLists.isEmpty
          ? const EmptyList()
          : ShoppingList(itemsList: itemLists),
      floatingActionButton: FloatingActionButton(
        key: Key("addListBtn"),
        onPressed: addList,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
