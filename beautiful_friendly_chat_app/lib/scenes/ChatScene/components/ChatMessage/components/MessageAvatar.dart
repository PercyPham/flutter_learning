import 'package:flutter/material.dart';

class MessageAvatar extends StatelessWidget {
  MessageAvatar({this.textDisplay});

  final String textDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: new CircleAvatar(child: new Text(textDisplay)),
    );
  }
}
