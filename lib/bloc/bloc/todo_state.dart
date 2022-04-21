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
  final List<Todo> todos;
  final Color color1;

  const TodoLoaded({this.todos = const <Todo>[], this.color1 = Colors.green});

  @override
  List<Object> get props => [todos, color1];
}
