part of 'todo_bloc.dart';

@immutable
abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {
  final List<Todo> todos;

  const LoadTodos({this.todos = const <Todo>[]});

  @override
  List<Object> get props => [todos];
}

class AddTodo extends TodosEvent {
  final Todo todo;

  const AddTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class ColorTodo extends TodosEvent {
  final Todo todo;

  const ColorTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodosEvent {
  final Todo todo;

  const DeleteTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}
/*
class TodoWhite extends TodosEvent {
  final List<Todo> todos;

  const TodoWhite({this.todos = const <Todo>[]});

  @override
  List<Object> get props => [todos];
}

class TodoGreen extends TodosEvent {
  final Color color;

  const TodoGreen({this.color = Colors.green});

  @override
  List<Object> get props => [color];
}
*/