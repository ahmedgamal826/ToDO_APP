import 'package:flutter/material.dart';
import 'package:todo_app_using_sqflite/cubit/todoo_cubit.dart';

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()), // id for each task
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 45,
              child: Text(
                '${model['time']}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'done', id: model['id']);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Task Added to Done Tasks',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  duration: Duration(seconds: 3),
                ));
              },
              icon: const Icon(
                Icons.done,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'archieve', id: model['id']);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Task Added to Archieved Tasks',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  duration: Duration(seconds: 3),
                ));
              },
              icon: const Icon(
                Icons.archive_outlined,
                size: 35,
              ),
            )
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Task Deleted',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 3),
        ));
      },
    );
