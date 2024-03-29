import 'package:course_projects/numbers_generator/numbers_generator.dart';
import 'package:flutter/material.dart';

import 'todo_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoHomeScreen(),
    );
  }
}
