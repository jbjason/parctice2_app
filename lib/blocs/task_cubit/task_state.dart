part of 'task_cubit.dart';

abstract class TaskState extends Equatable {
  const TaskState();
  @override
  List<Object> get props => [];
}

class TaskInitialState extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoadingState extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoadedState extends TaskState {
  final List<Task> allTasks;
  const TaskLoadedState({required this.allTasks});
  @override
  List<Object> get props => [allTasks];
}

class TaskErrorState extends TaskState {
  @override
  List<Object> get props => [];
}
