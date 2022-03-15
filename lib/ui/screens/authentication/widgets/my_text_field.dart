import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? Function(String?) validator;
  final IconData icon;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  const MyTextField(
      {required this.validator,
      required this.icon,
      required this.hint,
      required this.isPassword,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
          style: const TextStyle(color: Colors.blue),
          validator: validator,
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
              focusColor: Colors.blueAccent,
              prefixIcon: Icon(icon),
              hintText: hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
    );
  }
}
