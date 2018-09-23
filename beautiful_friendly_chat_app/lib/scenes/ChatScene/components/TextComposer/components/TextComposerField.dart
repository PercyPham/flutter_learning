import 'package:flutter/material.dart';

class TextComposerField extends StatelessWidget {
  TextComposerField({
    this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  final controller;
  final onChanged;
  final onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: new TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: (String text) => onSubmitted(),
        decoration: new InputDecoration.collapsed(hintText: "Send a message"),
      ),
    );
  }
}
