import 'package:flutter/material.dart';

class FilledTextField extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLines;
  final String? hintText;

  const FilledTextField({
    Key? key,
    required this.controller,
    this.maxLines,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300], // Background color
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]), // Hint text color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded borders
          borderSide: BorderSide.none, // No border
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      ),
    );
  }
}
