import 'package:flutter/material.dart';
import 'package:lista_de_compras/model/item_list.model.dart';
import 'package:lista_de_compras/pages/item_details.page.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key, required this.itemsList});

  final List<ItemList> itemsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (context, index) {
        final itemList = itemsList[index];
        final total = itemList.items.length;
        final bought = itemList.items.where((item) => item.isBuy).length;

        return Card(
          child: ListTile(
            title: Row(
              children: [
                Expanded(child: Text(itemList.name)),
                Text(
                  "$bought/$total",
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
              ],
            ),
            subtitle: LinearProgressIndicator(
              value: total == 0 ? 0 : bought / total,
              color: Colors.green,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ItemDetailsPage(itemList: itemList,)),
              );
            },
          ),
        );
      },
    );
  }
}
