import 'package:flutter/material.dart';
import './components/ChatMessage/ChatMessage.dart';
import './components/MessageHistory/MessageHistory.dart';
import './components/TextComposer/TextComposer.dart';

class ChatScene extends StatefulWidget {
  @override
  _ChatSceneState createState() => _ChatSceneState();
}

class _ChatSceneState extends State<ChatScene> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Friendly Chat")),
      body: Column(
        children: <Widget>[
          MessageHistory(messages: _messages),
          Divider(height: 1.0),
          TextComposer(handleSubmit: _handleSubmit),
        ],
      ),
    );
  }

  void _handleSubmit(String text) {
    ChatMessage message = ChatMessage(
      message: text,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}
