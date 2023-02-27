import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parctice2_app/blocs/task_bloc/task_bloc.dart';
import 'package:parctice2_app/models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        children: tasks
            .map(
              (e) => ExpansionPanelRadio(
                value: e.id,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) => _row(e, context),
                body: const Text(
                    'skjghksdjgh sjdkgggggggggggggggggggggggggggg skjgggggggg'),
              ),
            )
            .toList(),
      ),
    );
    // return ListView.builder(
    //   itemCount: tasks.length,
    //   itemBuilder: (context, index) {
    //     final task = tasks[index];
    //     return Container(
    //       height: 120,
    //       margin: const EdgeInsets.only(bottom: 10),
    //       color: Colors.grey[200],
    //       padding: const EdgeInsets.all(15),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             ExpansionTile(
    //               childrenPadding: const EdgeInsets.all(20),
    //               title: _row(task, context),
    //               children: const [
    //                 Text(
    //                     'skjghksdjgh sjdkgggggggggggggggggggggggggggg skjgggggggg'),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  Widget _row(Task task, BuildContext context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(
              task.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: task.isDone
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
            const Spacer(),
            // CheckBox & Restore Button
            _checkBoxRestore(task, context),
            const SizedBox(width: 10),
            // remove, delete, restore buttons
            _deleteRemoveIcon(task, context),
          ],
        ),
      );

  Widget _checkBoxRestore(Task task, BuildContext ctx) {
    return task.isDeleted
        ?
        // reStore
        IconButton(
            onPressed: () {
              ctx.read<TaskBloc>().add(RestoreTaskEvent(task: task));
            },
            icon: const Icon(Icons.moving_outlined, color: Colors.green),
          )
        : Checkbox(
            value: task.isDone,
            onChanged: (_) {
              ctx.read<TaskBloc>().add(UpdateTaskEvent(task: task));
            },
          );
  }

  Widget _deleteRemoveIcon(Task task, BuildContext ctx) {
    return task.isDeleted
        ?
        // forever delete
        IconButton(
            onPressed: () {
              ctx.read<TaskBloc>().add(DeleteTaskEvent(task: task));
            },
            icon: const Icon(Icons.delete_outline_sharp, color: Colors.red),
          )
        : IconButton(
            onPressed: () {
              // Move to recycleBin
              ctx.read<TaskBloc>().add(RemoveTaskEvent(task: task));
            },
            icon: const Icon(Icons.close),
          );
  }
}
