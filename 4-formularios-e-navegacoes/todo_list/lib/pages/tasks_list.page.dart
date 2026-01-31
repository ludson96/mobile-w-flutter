import 'package:flutter/material.dart';
import 'package:todo_list/models/task.model.dart';

class TasksListPage extends StatefulWidget {
  const TasksListPage({super.key});

  @override
  State<TasksListPage> createState() => _TasksListPageState();
}

class _TasksListPageState extends State<TasksListPage> {
  final List<Task> tasks = [
    Task(title: "Hora do Hu3", description: "Melhor hora do dia"),
    Task(
      title: "Segunda tarefa",
      description: "Eu sou a descrição da segunda tarefa",
      important: true,
    )..completed = true,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Tarefas')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Nova tarefa"),
        icon: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];

            return Card(
              elevation: 3,
              color: Colors.indigo[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(task.title),
                subtitle: task.description != null
                    ? Text(task.description!)
                    : null,
                leading: Checkbox(
                  value: task.completed,
                  onChanged: (value) {
                    setState(() {
                      task.changeStatus(value!);
                    });
                  },
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      task.changeImportant();
                    });
                  },
                  color: Colors.indigo,
                  icon: Icon(
                    task.important == true ? Icons.star : Icons.star_border,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
