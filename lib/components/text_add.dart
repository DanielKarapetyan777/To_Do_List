import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc/todo_bloc.dart';
import 'buttons_add_qlear.dart';

class TextFieldAdd extends StatelessWidget {
  const TextFieldAdd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTask = TextEditingController();

    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is TodoLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("To Do Added!"),
            ),
          );
        }
      },
      child: SizedBox(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, left: 40, right: 40),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.06),
                    offset: Offset(0, 12),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextField(
                controller: controllerTask,
                decoration: const InputDecoration(
                  hintText: 'Add',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(104, 75, 116, 79),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            ButtonsAddClear(controllerTask: controllerTask),
          ],
        ),
      ),
    );
  }
}
