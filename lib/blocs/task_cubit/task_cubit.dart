import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:parctice2_app/models/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  late List<Task> taskList;
  TaskCubit() : super(TaskInitialState());

  void getTask() async {
    emit(TaskLoadingState());
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        final decodedList = list.map((e) => Task.fromMap(e)).toList();
        taskList = [...decodedList];
        emit(TaskLoadedState(allTasks: taskList));
      } else {
        emit(TaskErrorState());
      }
    } catch (e) {
      emit(TaskErrorState());
    }
  }
}
