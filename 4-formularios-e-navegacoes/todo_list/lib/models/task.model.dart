class Task {
  String title;
  String? description;
  bool completed;
  bool important;
  DateTime createdAt;

  Task({required this.title, this.description, this.important = false})
    : completed = false,
      createdAt = DateTime.now()  ;

  void changeStatus(bool status) {
    completed = status;
  }

  void changeImportant() {
    important = !important;
  }
}
