import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parctice2_app/models/task.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>(_addTaskEvent);
    on<UpdateTaskEvent>(_updateTaskEvent);
    on<RemoveTaskEvent>(_removeTaskEvent);
    on<RestoreTaskEvent>(_restoreTaskEvent);
    on<DeleteTaskEvent>(_deleteTaskEvent);
  }

  void _addTaskEvent(AddTaskEvent event, Emitter<TaskState> emit) {
    emit(
      TaskState(
        allTasks: List.from(state.allTasks)..add(event.task),
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _updateTaskEvent(UpdateTaskEvent event, Emitter<TaskState> emit) {
    // first removing the task then adding with the new value
    final task = event.task;
    final List<Task> allTask = List.from(state.allTasks)..remove(task);
    final index = state.allTasks.indexOf(task);
    task.isDone == false
        ? allTask.insert(index, task.copyWith(isDone: true))
        : allTask.insert(index, task.copyWith(isDone: false));
    emit(TaskState(allTasks: allTask, removedTasks: state.removedTasks));
  }

  void _removeTaskEvent(RemoveTaskEvent event, Emitter<TaskState> emit) {
    // removing from allTask then adding the task to RemovedTaskList
    emit(
      TaskState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  void _restoreTaskEvent(RestoreTaskEvent event, Emitter<TaskState> emit) {
    // removing the task from RemovedTaskList & adding to AllTasks
    emit(
      TaskState(
        allTasks: List.from(state.allTasks)
          ..add(event.task.copyWith(isDeleted: false)),
        removedTasks: List.from(state.removedTasks)..remove(event.task),
      ),
    );
  }

  void _deleteTaskEvent(DeleteTaskEvent event, Emitter<TaskState> emit) {
    // deleting the task forrver from RemovedTasksList
    emit(
      TaskState(
        allTasks: state.allTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task),
      ),
    );
  }
}
