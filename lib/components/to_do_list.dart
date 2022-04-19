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
                    return _todoCard(context, state.todos[index]);
                  }),
            ),
          );
        } else {
          return const Center(
            child: Text('Sumething went wrong!!'),
          );
        }
      },
    );
  }

  Card _todoCard(BuildContext context, Todo todo) {
    return Card(
      child: ListTile(
        /*leading: Text(
          (index + 1).toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),*/
        title: Text(todo.task),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_sharp,
            color: Color.fromARGB(255, 100, 168, 119),
          ),
          onPressed: () {
            context.read<TodoBloc>().add(
                  DeleteTodo(todo: todo),
                );
          },
        ),
      ),
    );
  }
}


/* 
@override
  void initState() {
    super.initState();
    todolist.addAll(['Text1', 'Text2', 'Text3']);
  }
*/