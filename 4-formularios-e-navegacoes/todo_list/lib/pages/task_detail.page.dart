import 'package:flutter/material.dart';
import 'package:todo_list/models/task.model.dart';

class TaskDetailPage extends StatefulWidget {
  final Task task;

  const TaskDetailPage({super.key, required this.task});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  final titleConstroller = TextEditingController();
  final descriptionController = TextEditingController();

  late bool isImportant;

  @override
  void initState() {
    super.initState();

    titleConstroller.text = widget.task.title;
    descriptionController.text = widget.task.description ?? "";
    isImportant = widget.task.important;
  }

  void saveTask() {
    final updatedTask = widget.task;

    updatedTask.changeStatus(isImportant);
    updatedTask.title = titleConstroller.text;
    updatedTask.description = descriptionController.text.isEmpty
        ? null
        : descriptionController.text;

    Navigator.of(context).pop(updatedTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isImportant = !isImportant;
              });
            },
            icon: Icon(!isImportant ? Icons.star_border : Icons.star),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: titleConstroller,
              decoration: const InputDecoration(labelText: "Título"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "Descrição",
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 40),
            TextButton(onPressed: saveTask, child: const Text("Salvar tarefa")),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Criado Sex, 24 de mar"),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline),
                  iconSize: 28,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
