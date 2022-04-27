import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/models/todo_model.dart';
part 'todo_event.dart';
part 'todo_state.dart';

Color colortodo = Colors.lightGreenAccent;
int indexs = 0;

class TodoBloc extends Bloc<TodosEvent, TodoState> {
  TodoBloc() : super(TodoEmpty()) {
    on<LoadTodos>(_onLoadTodus);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<ColorTodo>(_onColorTodo);
  }

  void _onLoadTodus(LoadTodos event, Emitter<TodoState> emit) {
    emit(TodoLoaded(todos: event.todos));
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      emit(
        TodoLoaded(
          todos: List<Todo>.from(state.todos)..add(event.todo),
        ),
      );
    }
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      List<Todo> todos = state.todos.where((todo) {
        return todo.task != event.todo.task;
      }).toList();
      emit(
        TodoLoaded(
          todos: todos,
        ),
      );
    }
  }

  void _onColorTodo(ColorTodo event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      List<Todo> todos = [];
      for (var todo in state.todos) {
        if (todo.task == event.todo.task) {
          if (todo.isCompleted == true) {
            todo.isCompleted = false;
          } else {
            todo.isCompleted = true;
          }
          todos.add(todo);
        } else if (todo.task != event.todo.task) {
          todos.add(todo);
        }
        emit(
          TodoLoaded(todos: todos),
        );
      }
    }
  }
}
