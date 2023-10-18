import 'package:flutter/material.dart';

import 'date_time_utils.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  List<Map<String, String>> listTodo = [
    {"name": "Do homework 1", "time" : formatTime(DateTime.now())},
    {"name": "Do homework 2", "time" : formatTime(DateTime.now())},
    {"name": "Do homework 3", "time" : formatTime(DateTime.now())},
    {"name": "Do homework 4", "time" : formatTime(DateTime.now())},
    {"name": "Do homework 5", "time" : formatTime(DateTime.now())}
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
              return Card(
                child: ListTile(
                  leading: Checkbox(onChanged: (_) { }, value: false),
                  title: Text(listTodo[index]["name"] ?? "", style: TextStyle(fontSize: 20, color: Colors.teal)),
                  subtitle: Text(listTodo[index]["time"] ?? "", style: TextStyle(fontSize: 14, color: Colors.red)),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {  },
                  ),

                )
              );
            },
        )
      ),
    );
  }
}
