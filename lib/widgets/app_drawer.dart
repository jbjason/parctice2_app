import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parctice2_app/blocs/task_bloc/task_bloc.dart';
import 'package:parctice2_app/screens/recyle_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () => Navigator.pushNamed(context, RecyleScreen.routeName),
              leading: const Icon(Icons.delete_outline),
              title: const Text('Recycle Screen'),
              trailing: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) =>
                    Text('${state.removedTasks.length}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
