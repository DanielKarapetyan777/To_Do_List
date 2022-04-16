import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/user_bloq.dart';
import 'package:to_do_list/components/text_add.dart';
import 'package:to_do_list/servises/user_repositori.dart';

import 'components/buttons_add_qlear.dart';
import 'components/to_do_list.dart';

class HomePage extends StatelessWidget {
  HomePage({key}) : super(key: key);
  final userRepository = UserRepositori();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 100, 168, 119),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 100, 168, 119),
          title: const Text(
            'Todo List',
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: SizedBox(
          child: Column(
            children: const [TextFieldAdd(), ButtonsAddClear(), ToDoList()],
          ),
        ),
      ),
    );
  }
}
