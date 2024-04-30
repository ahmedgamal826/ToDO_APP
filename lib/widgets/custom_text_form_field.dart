import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.validator,
      this.onTap,
      required this.prefixIcon})
      : super(key: key);

  final TextEditingController controller;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String label;
  String? Function(String?)? validator;
  void Function()? onTap;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onTap: onTap,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
