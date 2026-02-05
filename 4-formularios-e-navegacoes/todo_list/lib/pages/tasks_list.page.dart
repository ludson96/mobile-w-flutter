import 'package:flutter/material.dart';
import 'package:todo_list/models/task.model.dart';
import 'package:todo_list/pages/task_detail.page.dart';
import 'package:todo_list/widgets/add_task.widget.dart';

class TasksListPage extends StatefulWidget {
  const TasksListPage({super.key});

  @override
  State<TasksListPage> createState() => _TasksListPageState();
}

class _TasksListPageState extends State<TasksListPage> {
  final List<Task> tasks = [];

  void addTask() async {
    final newTask = await showModalBottomSheet<Task>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const AddTask(),
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  void updateTask(Task task, int index) async {
    final resultUpdated = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => TaskDetailPage(task: task)));

    if (resultUpdated != null) {
      setState(() {
        if (resultUpdated is Task) {
          tasks[index] = resultUpdated;
        } else {
          tasks.removeAt(index);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Tarefas')),

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
                onTap: () => updateTask(task, index),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addTask();
        },
        label: const Text("Nova tarefa"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
