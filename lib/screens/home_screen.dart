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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TaskCubit>(context).getTask();
                },
                child: const Text('Load Data'),
              ),
            ),
            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TaskLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TaskErrorState) {
                  return const Center(child: Text('Error Occured'));
                } else if (state is TaskLoadedState) {
                  return _listView(state.allTasks, context);
                } else {
                  return Container(
                      margin: const EdgeInsets.all(20), color: Colors.grey);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView(List<Task> allTasks, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: allTasks.length,
      itemBuilder: (context, i) {
        return Container(
          color: Colors.deepPurple[100],
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 10, left: 20, right: 10),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(allTasks[i].id),
              const SizedBox(width: 10),
              const Text('jb'),
            ],
          ),
        );
      },
    );
  }
}
