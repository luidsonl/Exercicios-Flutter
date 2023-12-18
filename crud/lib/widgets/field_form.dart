import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;

  const FieldForm({
    required this.label,
    required this.isPassword,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
      ),
    );
  }
}
