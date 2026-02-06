import 'package:flutter/material.dart';
import 'package:lista_de_compras/model/item_list.model.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key, required this.itemList});

  final ItemList itemList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemList.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(height: 30),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Não marcados"),
                    Text(
                      "R\$ 0.00",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Marcados"),
                    Text(
                      "R\$ 0.00",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
