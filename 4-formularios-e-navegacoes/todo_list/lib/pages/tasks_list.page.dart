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
        // icon: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 3,
              color: Colors.indigo[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: const Text("Marcar uma reunião"),
                subtitle: const Text("Reunião sobre negócios"),
                leading: Checkbox(value: true, onChanged: (value) {}),
                trailing: const Icon(Icons.star, color: Colors.indigo),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
