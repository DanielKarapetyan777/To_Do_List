part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoEmpty extends TodoState {}

class TodoLoading extends TodoState {}

// ignore: must_be_immutable
class TodoLoaded extends TodoState {
  List<Todo> todos;

  TodoLoaded({this.todos = const <Todo>[]});

  @override
  List<Object> get props => [todos];
}
