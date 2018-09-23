import 'package:flutter/material.dart';

class TextComposerSubmitButton extends StatelessWidget {
  TextComposerSubmitButton({
    this.isActive,
    this.onPressed,
  });

  final bool isActive;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 4.0),
      child: new IconButton(
        icon: new Icon(Icons.send),
        onPressed: isActive ? onPressed : null,
      ),
    );
  }
}
