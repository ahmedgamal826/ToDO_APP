import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_using_sqflite/cubit/todoo_cubit.dart';
import 'package:todo_app_using_sqflite/cubit/todo_states.dart';
import 'package:todo_app_using_sqflite/widgets/tasks_builder.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, toDoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return tasksBuilder(tasks: AppCubit.get(context).tasks!);
      },
    );
  }
}
