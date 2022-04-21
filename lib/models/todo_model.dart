import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Todo extends Equatable {
  //final String id;
  final Color color1;
  final String task;
  bool? isCompleted;
  bool? isCanselled;

  Todo({
    //required this.id,
    this.color1 = Colors.white,
    required this.task,
    this.isCompleted,
    this.isCanselled,
  }) {
    isCanselled = isCanselled ?? false;
    isCompleted = isCompleted ?? false;
  }

  Todo copyWith({
    //String? id,
    Color? color1,
    String? task,
    bool? isCompleted,
    bool? isCanselled,
  }) {
    return Todo(
      //id: id ?? this.id,
      task: task ?? this.task,
      isCanselled: isCanselled ?? this.isCanselled,
      isCompleted: isCompleted ?? this.isCompleted,
      color1: color1 ?? this.color1,
    );
  }

  @override
  List<Object?> get props => [
        //id,
        color1,
        task,
        isCanselled,
        isCompleted,
      ];
  static List<Todo> todos = [
    Todo(
      task: "Sample ToDo 1",
    ),
    Todo(
      task: "Sample ToDo 2",
    ),
    Todo(
      task: "Sample ToDo 3",
    ),
  ];
}
