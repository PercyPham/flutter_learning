import 'package:beautiful_friendly_chat_app/scenes/ChatScene/components/ChatMessage/ChatMessage.dart';
import 'package:flutter/material.dart';

class MessageHistory extends StatelessWidget {
  MessageHistory({this.messages});

  final List<ChatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: new ListView.builder(
        padding: new EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (_, int index) => messages[index],
        itemCount: messages.length,
      ),
    );
  }
}
