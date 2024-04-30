import 'package:flutter/material.dart';
import 'package:todo_app_using_sqflite/screens/home_page.dart';

void main(context) async {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
