import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String id;
  final String title;
  final String isDone;
  final String isDeleted;

  const Task(
      {required this.id,
      required this.title,
      required this.isDone,
      required this.isDeleted});

  Task copyWith(
      {String? id, String? title, String? isDone, String? isDeleted}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['userId'] as String,
      isDone: map['title'] as String,
      isDeleted: map['body'] as String,
    );
  }

  @override
  List<Object?> get props => [id, title, isDone, isDeleted];
}
