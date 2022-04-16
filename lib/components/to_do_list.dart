import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/user_bloq.dart';
import 'package:to_do_list/bloc/user_states.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  @override
  List todolist = [];
  String text1 = '';

  @override
  void initState() {
    super.initState();
    todolist.addAll(['Text1', 'Text2', 'Text3']);
  }

  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return const Center(
            child: Text(
              'click on "Add" to add the list',
              style: TextStyle(fontSize: 17),
            ),
          );
        }

        if (state is UserLoadingState) {
          return const Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is UserLoadedState) {
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                itemCount: todolist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      title: Text(todolist[index]),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_sharp,
                          color: Color.fromARGB(255, 100, 168, 119),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              todolist.removeAt(index);
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

/*class StateInit extends StatefulWidget {
  const StateInit({Key? key}) : super(key: key);

  @override
  State<StateInit> createState() => _StateInitState();
}

class _StateInitState extends State<StateInit> {
  List todolist = [];
  String text1;

  @override
  void initState() {
    super.initState();
    todolist.addAll(['Text1', 'Text2', 'Text3',text1]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}*/
