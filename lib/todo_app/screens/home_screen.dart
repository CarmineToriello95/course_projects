import 'package:course_projects/todo_app/models/todo.dart';
import 'package:flutter/material.dart';

class ToDoHomeScreen extends StatefulWidget {
  @override
  _ToDoHomeScreenState createState() => _ToDoHomeScreenState();
}

class _ToDoHomeScreenState extends State<ToDoHomeScreen> {
  final todoList = ToDo.generateTodos();
  String todoTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                onChanged: (value) {
                  todoTitle = value;
                },
                decoration: InputDecoration(
                  hintText: 'Titolo',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(20),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (todoTitle.isNotEmpty) {
                        final createdTodo = ToDo(title: todoTitle);
                        setState(
                          () {
                            todoList.add(createdTodo);
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  final currentTodo = todoList.elementAt(index);
                  return ListTile(
                    leading: Checkbox(
                      value: currentTodo.isDone,
                      onChanged: (value) {
                        setState(() {
                          currentTodo.isDone = value;
                        });
                      },
                    ),
                    title: Text(
                      currentTodo.title,
                      style: TextStyle(
                        decoration: currentTodo.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        final isConfirmed = await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Confermi di cancellare'),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: Text('NO'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: Text('SI'),
                                ),
                              ],
                            );
                          },
                        );
                        if (isConfirmed) {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
