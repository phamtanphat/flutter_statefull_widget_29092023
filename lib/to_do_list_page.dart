import 'dart:ffi';

import 'package:flutter/material.dart';

import 'date_time_utils.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  List<Map<String, dynamic>> listTodo = [
    {"name": "Do homework 1", "time" : formatTime(DateTime.now()), "isChecked": false},
    {"name": "Do homework 2", "time" : formatTime(DateTime.now()), "isChecked": false},
    {"name": "Do homework 3", "time" : formatTime(DateTime.now()), "isChecked": false},
    {"name": "Do homework 4", "time" : formatTime(DateTime.now()), "isChecked": false},
    {"name": "Do homework 5", "time" : formatTime(DateTime.now()), "isChecked": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List Page"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ListView.builder(
            itemCount: listTodo.length,
            itemBuilder: (context, index) {
                String name = listTodo[index]["name"] ?? "";
                String time = listTodo[index]["time"] ?? "";
                bool isChecked = listTodo[index]["isChecked"] ?? false;
                return itemTodoWidget(
                  name: name,
                  time: time,
                  isChecked: isChecked,
                  index: index,
                  onClickCheckBox: onListenCheckBox,
                  onClickEdit: onListenEditItem
                );
            },
        )
      ),
    );
  }

  void onListenCheckBox(bool? isChecked, int index) {

  }

  void onListenEditItem(int index) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Click edit item index $index")));
  }

  Widget itemTodoWidget({
    required String name,
    required String time,
    required bool isChecked,
    required int index,
    required Function(bool?, int index) onClickCheckBox,
    required Function(int index) onClickEdit
  }) {
    return Card(
        child: ListTile(
          leading: Checkbox(
              onChanged: (isChecked) => onClickCheckBox(isChecked, index),
              value: isChecked),
          title: Text(name, style: const TextStyle(fontSize: 20, color: Colors.teal)),
          subtitle: Text(time, style: const TextStyle(fontSize: 14, color: Colors.red)),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => onClickEdit(index),
          ),
        )
    );
  }
}
