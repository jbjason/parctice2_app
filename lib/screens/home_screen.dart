import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parctice2_app/blocs/task_bloc/task_bloc.dart';
import 'package:parctice2_app/screens/add_task_screen.dart';
import 'package:parctice2_app/screens/tasks_screen.dart';
import 'package:parctice2_app/widgets/app_drawer.dart';
import 'package:parctice2_app/widgets/switch_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-Screen';
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  void _addTask(BuildContext context, GlobalKey<ScaffoldState> key) {
    key.currentState!.showBottomSheet(
      (context) => const AddTaskScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Tasks Screen'),
            actions: const [SwitchWidget()],
          ),
          body: TasksScreen(tasks: state.allTasks, index: _navIndex),
          drawer: const AppDrawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context, scaffoldKey),
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (val) => setState(() => _navIndex = val),
            items: const [
              BottomNavigationBarItem(
                  label: 'All Task', icon: Icon(CupertinoIcons.chart_bar)),
              BottomNavigationBarItem(
                  label: 'Completed Tasks', icon: Icon(CupertinoIcons.heart)),
            ],
          ),
        );
      },
    );
  }
}
