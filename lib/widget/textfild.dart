import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SbtTextFild extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  SbtTextFild({
    super.key,
    required this.textEditingController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
