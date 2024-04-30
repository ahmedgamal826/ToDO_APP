import 'package:flutter/material.dart';
import 'package:todo_app_using_sqflite/cubit/todoo_cubit.dart';

Widget BottomNavigatorBar(BuildContext context) {
  AppCubit cubit = AppCubit.get(context);
  return BottomNavigationBar(
    currentIndex: cubit.currentIndex,
    onTap: (index) {
      cubit.changePage(index);
    },
    items: const [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
            size: 35,
          ),
          label: 'Tasks'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.done,
            size: 35,
          ),
          label: 'Done'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.archive,
            size: 35,
          ),
          label: 'Archived'),
    ],
  );
}
