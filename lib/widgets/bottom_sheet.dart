import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_using_sqflite/cubit/todoo_cubit.dart';
import 'package:todo_app_using_sqflite/widgets/custom_text_form_field.dart';

Widget CustomBottomSheet(BuildContext context) {
  AppCubit cubit = AppCubit.get(context);
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.all(
      20.0,
    ),
    child: Form(
      key: cubit.formKey,
      child: Center(
        child: ListView(
          children: [
            CustomTextFormField(
                onTap: () {
                  print('Task Title');
                },
                controller: cubit.titleController,
                label: 'Task Title',
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Title is required';
                  }
                },
                prefixIcon: Icons.title),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000),
                  ).then((value) {
                    cubit.dateController.text =
                        DateFormat.yMMMd().format(value!);
                  });
                },
                controller: cubit.dateController,
                label: 'Task Date',
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Date is required';
                  }
                },
                prefixIcon: Icons.calendar_today),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                onTap: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    cubit.timeController.text =
                        value!.format(context).toString();
                  });
                },
                controller: cubit.timeController,
                label: 'Task Time',
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Time is required';
                  }
                },
                prefixIcon: Icons.watch_later_outlined),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
