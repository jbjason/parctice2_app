import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parctice2_app/blocs/task_cubit/task_cubit.dart';
import 'package:parctice2_app/models/task.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Load Data'),
            ),
            Expanded(
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  if (state is TaskLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TaskErrorState) {
                    return const Center(child: Text('Error Occured'));
                  } else if (state is TaskLoadedState) {
                    return _listView(state.allTasks);
                  } else {
                    return Container(height: 80, width: 80, color: Colors.red);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView(List<Task> allTasks) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: allTasks.length,
      itemBuilder: (context, i) {
        return Container(
          height: 80,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(allTasks[i].id),
              const SizedBox(),
              Text(allTasks[i].id, overflow: TextOverflow.fade),
              const SizedBox(width: 10),
              Text(allTasks[i].id),
            ],
          ),
        );
      },
    );
  }
}
