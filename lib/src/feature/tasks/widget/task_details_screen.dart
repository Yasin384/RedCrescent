import 'package:flutter/material.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:red_crescent/src/feature/tasks/widget/tasks_screen.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.taskResult});

  final TaskResult taskResult;

  static const routePath = 'details';
  static const routeName = 'taskDetails';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(taskResult.title)
    );
  }
}
