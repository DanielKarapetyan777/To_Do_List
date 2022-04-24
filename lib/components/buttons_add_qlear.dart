import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc/todo_bloc.dart';
import 'package:to_do_list/models/todo_model.dart';

class ButtonsAddClear extends StatelessWidget {
  const ButtonsAddClear({
    Key? key,
    required this.controllerTask,
  }) : super(key: key);

  final TextEditingController controllerTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 15),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            height: 50,
            child: TextButton(
              onPressed: () {
                var todo = Todo(
                  task: controllerTask.value.text,
                );
                context.read<TodoBloc>().add(
                      AddTodo(todo: todo),
                    );
                controllerTask.clear();
              },
              child: const Text(
                'Add',
                style: TextStyle(
                    color: Color.fromARGB(255, 48, 47, 47), fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 150,
            height: 50,
            child: TextButton(
              onPressed: () {
                controllerTask.clear();
              },
              child: const Text(
                'Clear',
                style: TextStyle(
                    color: Color.fromARGB(255, 48, 47, 47), fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
