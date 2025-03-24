import 'package:flutter/material.dart';
import 'package:to_do/utils/todo_list.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _controller = TextEditingController();

  List toDoList = [
    ['belanja ke hokky', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      if (_controller.text.isEmpty) return;
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF393E46),
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        backgroundColor: Color(0xFF222831),
        foregroundColor: Color(0xFFEEEEEE),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 15.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'What to do?',
                  filled: true,
                  fillColor: Color(0xFFEEEEEE),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF222831)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF222831)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            backgroundColor: Color(0xFFFFD369),
            foregroundColor: Color(0xFF222831),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
