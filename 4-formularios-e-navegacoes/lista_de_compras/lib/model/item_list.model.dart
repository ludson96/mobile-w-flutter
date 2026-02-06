import 'package:lista_de_compras/model/item.model.dart';

class ItemList {
  String name;
  List<Item> items;

  ItemList({required this.name, List<Item>? items}) : items = items ?? [];
}
