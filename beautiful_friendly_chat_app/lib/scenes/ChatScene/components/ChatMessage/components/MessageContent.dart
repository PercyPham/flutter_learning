import 'package:flutter/material.dart';

class MessageContent extends StatelessWidget {
  MessageContent({this.sender, this.message});

  final String sender;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          sender,
          style: Theme.of(context).textTheme.subhead,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new Text(message),
        ),
      ],
    );
  }
}
