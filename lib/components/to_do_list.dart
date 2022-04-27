import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc/todo_bloc.dart';
import 'package:to_do_list/models/todo_model.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoEmpty) {
          return const Expanded(
            child: Text('click on "Add" to add the list'),
          );
        }

        if (state is TodoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TodoLoaded) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _todoCard(context, state.todos[index], index, state);
                  }),
            ),
          );
        } else {
          return const Center(
            child: Expanded(
              child: Text('Sumething went wrong!!'),
            ),
          );
        }
      },
    );
  }

  Color colortodo = Colors.white;
  Card _todoCard(
    BuildContext context,
    Todo todo,
    int index,
    TodoLoaded state,
  ) {
    if (todo.isCompleted == true) {
      colortodo = Colors.lightGreenAccent;
    } else {
      colortodo = Colors.white;
    }
    return Card(
      color: colortodo,
      child: ListTile(
        leading: Text(
          (index + 1).toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        title: Text(
          todo.task,
        ),
        trailing: Container(
          height: double.infinity,
          width: 80,
          margin: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.done,
                  color: Color.fromARGB(255, 100, 168, 119),
                ),
                onPressed: () {
                  indexs = index;
                  context.read<TodoBloc>().add(
                        ColorTodo(todo: todo),
                      );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete_sharp,
                  color: Color.fromARGB(255, 100, 168, 119),
                ),
                onPressed: () {
                  indexs = index;
                  context.read<TodoBloc>().add(
                        DeleteTodo(todo: todo),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
