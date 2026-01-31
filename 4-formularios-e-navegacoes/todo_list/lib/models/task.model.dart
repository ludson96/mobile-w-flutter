class Task {
  String title;
  String? description;
  bool completed;
  bool important;

  Task({required this.title, this.description, this.important = false})
    : completed = false;

  void changeStatus(bool status) {
    completed = status;
  }

  void changeImportant() {
    important = !important;
  }
}
