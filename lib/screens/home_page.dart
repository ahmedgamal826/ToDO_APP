import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_using_sqflite/cubit/todoo_cubit.dart';
import 'package:todo_app_using_sqflite/cubit/todo_states.dart';
import 'package:todo_app_using_sqflite/widgets/floating_actionButton.dart';

class SS extends StatelessWidget {
  const SS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, toDoStates>(
        listener: (BuildContext context, state) {
          if (state is InsertState) Navigator.pop(context);
        },
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: cubit.scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                '${cubit.titles[cubit.currentIndex]}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            body: ConditionalBuilder(
              condition: cubit.tasks != null,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
            bottomNavigationBar: BottomNavigationBar(
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
            ),
            floatingActionButton: CustomFloatingActionBottom(context),
          );
        },
      ),
    );
  }
}
