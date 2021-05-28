import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget textFieldChild;

  const TextFieldContainer({this.textFieldChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xffe6e6e6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: textFieldChild,
    );
  }
}
