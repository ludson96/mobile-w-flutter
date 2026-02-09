class Item {
  String name;
  double value;
  bool isBuy;

  Item({required this.name, required this.value}) : isBuy = false;

  void changeStatus(bool status) {
    isBuy = status;
  }
}
