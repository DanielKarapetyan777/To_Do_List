import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc/todo_bloc.dart';
import 'package:to_do_list/models/todo_model.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc()
            ..add(
              LoadTodos(todos: [
                Todo(task: "Sample ToDo 1"),
                Todo(task: "Sample ToDo 2"),
                Todo(task: "Sample ToDo 3"),
              ]),
            ),
        )
      ],
      child: MaterialApp(
        title: 'Task 3',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
