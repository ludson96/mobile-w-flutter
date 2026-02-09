import 'package:flutter/material.dart';
import 'package:lista_de_compras/model/item_list.model.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addList() {
    final itemList = ItemList(name: nameController.text);

    Navigator.of(context).pop(itemList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: TextFormField(
                  key: Key("listNameInput"),
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text("Nome da lista"),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.zero,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  key: Key("backToListsBtn"),
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Voltar", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  key: Key("createListBtn"),
                  onPressed: addList,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: Colors.white,
                  ),
                  child: Text("Criar", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
