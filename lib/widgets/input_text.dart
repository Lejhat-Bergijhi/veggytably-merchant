import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  const InputTextField(this.textEditingController, this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 186, 192, 186).withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff9f9f9f),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 171, 174, 171), width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
