import 'package:flutter/material.dart';

class TasksListPage extends StatelessWidget {
  const TasksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Tarefas')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Nova tarefa"),
      ),
    );
  }
}
