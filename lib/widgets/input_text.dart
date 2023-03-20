import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String fontFamily;
  final TextInputType? textInputType;

  const InputTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.fontFamily = "Rubik",
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      //hint text color
      keyboardType: textInputType,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 186, 192, 186).withOpacity(0.1),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff9f9f9f),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 171, 174, 171), width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
