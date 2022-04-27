import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Todo extends Equatable {
  //final String id;
  //final Color colortodo;
  final String task;
  bool? isCompleted;
  bool? isCanselled;

  Todo({
    //required this.id,
    //required this.colortodo,
    required this.task,
    this.isCompleted,
    this.isCanselled,
  }) {
    isCanselled = isCanselled ?? false;
    isCompleted = isCompleted ?? false;
  }

  Todo copyWith({
    //String? id,
    Color? colortodo,
    String? task,
    bool? isCompleted,
    bool? isCanselled,
  }) {
    return Todo(
      //id: id ?? this.id,
      task: task ?? this.task,
      isCanselled: isCanselled ?? this.isCanselled,
      isCompleted: isCompleted ?? this.isCompleted,
      //colortodo: colortodo ?? this.colortodo,
    );
  }

  @override
  List<Object?> get props => [
        //id,
        //colortodo,
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
