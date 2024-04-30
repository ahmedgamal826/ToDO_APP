import 'package:flutter/material.dart';
import 'package:todo_app_using_sqflite/cubit/todoo_cubit.dart';
import 'package:todo_app_using_sqflite/widgets/bottom_sheet.dart';

Widget CustomFloatingActionBottom(BuildContext context) {
  AppCubit cubit = AppCubit.get(context);
  return FloatingActionButton(
    child: Icon(
      cubit.fabIcon,
      size: 30,
    ),
    onPressed: () {
      if (cubit.isBottomSheetShown) {
        if (cubit.formKey.currentState!.validate()) {
          cubit.insertToDatabase(
            title: cubit.titleController.text,
            time: cubit.dateController.text,
            date: cubit.timeController.text,
          );
        }
      } else {
        cubit.scaffoldKey.currentState!
            .showBottomSheet(
              (context) => CustomBottomSheet(context),
              elevation: 20.0,
            )
            .closed
            .then(
          (value) {
            cubit.changeBottomSheetState(isShown: false, fabIcon2: Icons.edit);
          },
        );
        cubit.changeBottomSheetState(isShown: true, fabIcon2: Icons.add);
      }
    },
  );
}
