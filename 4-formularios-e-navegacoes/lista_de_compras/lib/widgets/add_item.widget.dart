import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_de_compras/model/item.model.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final nameItemController = TextEditingController();
  final valueItemController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addItemInList() {
    if (!formKey.currentState!.validate()) return;

    final newItem = Item(
      name: nameItemController.text,
      value:
          double.tryParse(valueItemController.text.replaceAll(',', '.')) ?? 0.0,
    );

    Navigator.of(context).pop(newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adicionar Item",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Divider(),
            TextFormField(
              controller: nameItemController,
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text("Nome do item"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo obrigatório";
                }

                return null;
              },
            ),
            TextFormField(
              controller: valueItemController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text("R\$ 0,00"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: addItemInList,
                  child: Text(
                    "Adicionar",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
