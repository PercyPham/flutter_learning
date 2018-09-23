import 'package:flutter/material.dart';

import './components/TextComposerField.dart';
import './components/TextComposerSubmitButton.dart';

class TextComposer extends StatefulWidget {
  TextComposer({this.handleSubmit});

  final handleSubmit;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return preStyleWrapper(
      child: new Row(
        children: <Widget>[
          buildTextComposerField(),
          buildTextComposerSubmitButton(),
        ],
      ),
    );
  }

  Widget preStyleWrapper ({child}) {
    return Container(
      decoration: new BoxDecoration(color: Theme.of(context).cardColor),
      child: IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: child,
        ),
      ),
    );
  }

  Widget buildTextComposerField() {
    return TextComposerField(
      controller: _textController,
      onChanged: (String text) {
        setState(() {
          _isComposing = text.length > 0;
        });
      },
      onSubmitted: (String text) {
        widget.handleSubmit(text);
        handleAfterSubmit();
      },
    );
  }

  Widget buildTextComposerSubmitButton() {
    return TextComposerSubmitButton(
      isActive: _isComposing,
      onPressed: () {
        widget.handleSubmit(_textController.text);
        handleAfterSubmit();
      },
    );
  }

  void handleAfterSubmit() {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
  }
}
