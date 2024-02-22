import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? helpText;
  final Function onChange;

  const CustomTextFieldWidget({
    super.key,
    required this.title,
    required this.controller,
    required this.onChange,
    this.helpText,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width * 0.9,
      child: TextField(
        textInputAction: TextInputAction.done,
        controller: controller,
        onChanged: (str) => onChange(str),
        style: TextStyle(color: Colors.grey[900]),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold, fontSize: 18),
          hintText: helpText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
