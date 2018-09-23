import 'package:flutter/material.dart';
import 'package:beautiful_friendly_chat_app/scenes/ChatScene/ChatScene.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendly Chat",
      home: new ChatScene(),
    );
  }
}
