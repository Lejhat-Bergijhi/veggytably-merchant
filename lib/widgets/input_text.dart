import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String fontFamily;

  const InputTextField(this.textEditingController, this.hintText, this.fontFamily);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: TextStyle(
        fontFamily: fontFamily,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
