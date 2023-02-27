import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parctice2_app/blocs/task_bloc/task_bloc.dart';
import 'package:parctice2_app/widgets/tasks_list.dart';

class RecyleScreen extends StatelessWidget {
  static const routeName = '/recyle-screen';
  const RecyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Tasks Screen'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // chip text at top Center
                Chip(label: Text('Remove Tasks: ${state.removedTasks.length}')),
                // tasks List
                Expanded(child: TasksList(tasks: state.removedTasks)),
              ],
            ),
          ),
        );
      },
    );
  }
}
