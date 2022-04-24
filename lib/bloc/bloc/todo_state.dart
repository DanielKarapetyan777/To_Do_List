part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoEmpty extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  List todos;
  Color colortodo;

  TodoLoaded(
      {this.todos = const <Todo>[], this.colortodo = Colors.lightGreenAccent});

  @override
  List<Object> get props => [todos, colortodo];
}
