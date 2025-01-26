import 'package:flutter/material.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.taskResult});

  final TaskResult taskResult;

  static const routePath = '/taskDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Страница деталей'),
        ),
        body: Text(taskResult.title));
  }
}
