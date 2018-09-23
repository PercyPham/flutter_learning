import 'package:beautiful_friendly_chat_app/scenes/ChatScene/components/ChatMessage/components/MessageAvatar.dart';
import 'package:beautiful_friendly_chat_app/scenes/ChatScene/components/ChatMessage/components/MessageContent.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({
    this.sender = "SenderName",
    this.message,
    this.animationController,
  });

  final String sender;
  final String message;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MessageAvatar(
              textDisplay: getFirstLetterOf(sender),
            ),
            MessageContent(
              sender: sender,
              message: message,
            ),
          ],
        ),
      ),
    );
  }

  String getFirstLetterOf (String sender) => sender[0];
}
