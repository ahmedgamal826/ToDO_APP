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













// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_app_using_sqflite/cubit/todo_cubit.dart';
// import 'package:todo_app_using_sqflite/cubit/todo_states.dart';
// import 'package:todo_app_using_sqflite/screens/done_tasks_screen.dart';

// class NewTasksScreen extends StatefulWidget {
//   const NewTasksScreen({super.key});

//   @override
//   State<NewTasksScreen> createState() => _NewTasksScreenState();
// }

// class _NewTasksScreenState extends State<NewTasksScreen> {
//   final List<bool> isSelectedList = []; // Initialize with empty list
//   final List<bool> isSelectedArchievedList = []; // Initialize with empty list

//   @override
//   Widget build(BuildContext context) {
//     var cubit = toDoCubit.get(context);
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       body: BlocConsumer<toDoCubit, toDoStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is InsertState ||
//               state is getDatafromDatabaseLoadingState) {
//             return ListView.builder(
//               physics: BouncingScrollPhysics(),
//               itemCount: cubit.newTasks.length,
//               itemBuilder: (context, index) {
//                 final task = cubit.newTasks[index];

//                 // Ensure _isSelectedList has matching entries for all tasks
//                 if (isSelectedList.length < cubit.newTasks.length) {
//                   isSelectedList.add(false); // Add false for new tasks
//                 }

//                 if (isSelectedArchievedList.length < cubit.newTasks.length) {
//                   isSelectedArchievedList.add(false); // Add false for new tasks
//                 }

//                 return ListTile(
//                   leading: Stack(
//                     //alignment: Alignment.center,
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         width: 95,
//                         height: 60,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: Color(0xffEADDFF)),
//                         child: Text(
//                           task['time'],
//                           style: TextStyle(fontSize: 20, color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                   title: Text(
//                     task['title'],
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     task['date'],
//                     style: TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // Update only the current item's isSelected state
//                           setState(() {
//                             isSelectedList[index] = !isSelectedList[index];
//                             if (isSelectedList[index]) {
//                               cubit.updateDB(status: 'done', id: 3);
//                               print("Transfer to Done Tasks Screen");
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => DoneTasksScreen(),
//                                 ),
//                               );
//                             }
//                           });
//                         },
//                         icon: Icon(
//                           Icons.check_box_outlined,
//                           size: 35,
//                           color: isSelectedList[index]
//                               ? Colors.green
//                               : Colors.black,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // Update only the current item's isSelected state
//                           setState(() {
//                             isSelectedArchievedList[index] =
//                                 !isSelectedArchievedList[index];
//                           });
//                         },
//                         icon: Icon(
//                           Icons.archive_outlined,
//                           size: 35,
//                           color: isSelectedArchievedList[index]
//                               ? Colors.red
//                               : Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return ListView.builder(
//               physics: BouncingScrollPhysics(),
//               itemCount: cubit.newTasks.length,
//               itemBuilder: (context, index) {
//                 final task = cubit.newTasks[index];

//                 // Ensure _isSelectedList has matching entries for all tasks
//                 if (isSelectedList.length < cubit.newTasks.length) {
//                   isSelectedList.add(false); // Add false for new tasks
//                 }

//                 return ListTile(
//                   leading: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         width: 100,
//                         height: 60,
//                         child: CircleAvatar(
//                           radius: 60,
//                           child: Text(
//                             task['time'],
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   title: Text(task['title']),
//                   subtitle: Text(task['date']),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // Update only the current item's isSelected state
//                           setState(() {
//                             isSelectedList[index] = !isSelectedList[index];
//                           });
//                         },
//                         icon: Icon(
//                           Icons.check_box_outlined,
//                           size: 30,
//                           color: isSelectedList[index]
//                               ? Colors.green
//                               : Colors.black,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // Update only the current item's isSelected state
//                           setState(() {
//                             isSelectedList[index] = !isSelectedList[index];
//                           });
//                         },
//                         icon: Icon(
//                           Icons.archive_outlined,
//                           size: 30,
//                           color: isSelectedList[index]
//                               ? Colors.black
//                               : Colors.green,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
