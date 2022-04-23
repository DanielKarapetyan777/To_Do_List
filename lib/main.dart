import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc/color_bloq.dart';
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
              LoadTodos(
                todos: [
                  Todo(task: "Sample ToDo 1", colortodo: Colors.white),
                  Todo(task: "Sample ToDo 2", colortodo: Colors.white),
                  Todo(task: "Sample ToDo 3", colortodo: Colors.white),
                ],
              ),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Task 3',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
