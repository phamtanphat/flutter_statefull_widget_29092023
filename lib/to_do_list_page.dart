import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'date_time_utils.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  List<Map<String, dynamic>> listTodo = [
    {"name": "Do homework 1", "time" : DateTime(2023, 10, 1), "isChecked": false},
    {"name": "Do homework 2", "time" : DateTime(2023, 10, 2), "isChecked": false},
    {"name": "Do homework 3", "time" : DateTime(2023, 10, 3), "isChecked": false},
    {"name": "Do homework 4", "time" : DateTime(2023, 10, 4), "isChecked": false},
    {"name": "Do homework 5", "time" : DateTime(2023, 10, 5), "isChecked": false}
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
                String time = formatTime(listTodo[index]["time"] ?? "");
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
    setState(() {
      var itemTodo = listTodo[index];
      itemTodo["isChecked"] = isChecked ?? false;
    });
  }

  void onClickCancelDialog() {
    Navigator.pop(context);
  }

  void onClickUpdateDialog(Map<String, dynamic> itemTodo, String newName, DateTime newTime) {
    setState(() {
      String name = itemTodo["name"] ?? "";
      DateTime time = itemTodo["time"] ?? DateTime.now();

      if (name == newName && time.millisecondsSinceEpoch == newTime.millisecondsSinceEpoch) return;
      itemTodo["name"] = newName;
      itemTodo["time"] = newTime;
      Navigator.pop(context);
    });
  }

  void onListenEditItem(int index) {
    Map<String, dynamic> itemTodo = listTodo[index];
    String name = itemTodo["name"] ?? "";
    DateTime time = itemTodo["time"] ?? DateTime.now();
    DateTime tmpTime = time;

    TextEditingController textEditController = TextEditingController(text: name);
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Center(
                            child: Text("Update todo",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)
                            )
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: textEditController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: Colors.black, width: 0.5)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: () {
                              setState(() {
                                tmpTime = increaseOneDay(tmpTime);
                              });
                            }, icon: Icon(Icons.upload)),
                            Text(formatTime(tmpTime)),
                            IconButton(onPressed: () {
                              setState(() {
                                tmpTime = decreaseOneDay(tmpTime);
                              });
                            }, icon: Icon(Icons.download)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(onPressed: onClickCancelDialog, child: Text("Cancel")),
                          ElevatedButton(onPressed: () => onClickUpdateDialog(itemTodo, textEditController.text, tmpTime), child: Text("Update")),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
    );
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
              onChanged: (checked) => onClickCheckBox(checked, index),
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
