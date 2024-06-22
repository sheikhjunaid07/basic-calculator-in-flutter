import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  const DisplayText(
      {super.key,
      this.hint = "Enter a number", //this text print when value is null
      required this.controller});

  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      // textDirection: TextDirection.ltr,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hint,
        // hintStyle: TextStyle(color: Colors.purpleAccent)
      ),
    );
  }
}
