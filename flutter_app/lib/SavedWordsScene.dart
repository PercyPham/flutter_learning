import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedWordsScene {
  static build(wordList, fontStyle) {
    return new MaterialPageRoute<void>(
      builder: (context) {
        final dividedWordList =
            _buildDividedWordList(context, wordList, fontStyle);

        return new Scaffold(
          appBar: new AppBar(
            title: const Text('Saved Words'),
          ),
          body: new ListView(children: dividedWordList),
        );
      },
    );
  }

  static List<Widget> _buildDividedWordList(
      BuildContext context, Set<WordPair> wordList, TextStyle fontStyle) {
    final wordTiles = _buildWordTiles(wordList, fontStyle);

    return ListTile.divideTiles(
      context: context,
      tiles: wordTiles,
    ).toList();
  }

  static _buildWordTiles(Set<WordPair> wordList, fontStyle) {
    return wordList.map(
      (wordPair) => new ListTile(
            title: new Text(
              wordPair.asPascalCase,
              style: fontStyle,
            ),
          ),
    );
  }
}
