import 'package:flutter/material.dart';
import 'package:parctice2_app/models/task.dart';
import 'package:parctice2_app/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;
  final int index;
  const TasksScreen({super.key, required this.tasks, required this.index});

  @override
  Widget build(BuildContext context) {
    final bool isIndex = index == 0;
    final title = isIndex ? 'All Tasks' : 'Complete Tasks';
    final List<Task> taskList =
        isIndex ? tasks : tasks.where((e) => e.isDone).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // chip text at top Center
          Chip(label: Text('$title: ${taskList.length}')),
          // tasks List
          Expanded(child: TasksList(tasks: taskList)),
        ],
      ),
    );
  }
}
