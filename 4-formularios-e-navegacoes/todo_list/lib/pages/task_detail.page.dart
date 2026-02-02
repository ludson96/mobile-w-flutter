import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Teste")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text("Sem descrição"),
      ),
    );
  }
}
