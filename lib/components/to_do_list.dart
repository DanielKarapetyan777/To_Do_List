import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  List todolist = [];

  @override
  void initState() {
    super.initState();
    todolist.addAll(['Text1', 'Text2', 'Text3']);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                      setState(() {
                        todolist.removeAt(index);
                      });
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
