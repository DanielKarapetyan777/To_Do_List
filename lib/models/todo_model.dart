import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  //final String id;
  final String task;
  bool? isCompleted;
  bool? isCanselled;

  Todo({
    //required this.id,
    required this.task,
    this.isCompleted,
    this.isCanselled,
  }) {
    isCanselled = isCanselled ?? false;
    isCompleted = isCompleted ?? false;
  }

  Todo copyWith({
    //String? id,
    String? task,
    bool? isCompleted,
    bool? isCanselled,
  }) {
    return Todo(
      //id: id ?? this.id,
      task: task ?? this.task,
      isCanselled: isCanselled ?? this.isCanselled,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        //id,
        task,
        isCanselled,
        isCompleted,
      ];
  static List<Todo> todos = [
    Todo(task: "Sample ToDo 1"),
    Todo(task: "Sample ToDo 2"),
    Todo(task: "Sample ToDo 3"),
  ];
}
