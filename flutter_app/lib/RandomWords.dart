import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/SavedWordsScene.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordList = <WordPair>[];
  final _savedWordsList = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        actions: <Widget>[_buildListIconButton()],
      ),
      body: _buildRandomWordListView(),
    );
  }

  _buildListIconButton() {
    return new IconButton(
      icon: const Icon(Icons.list),
      onPressed: _pushSavedWordsScene,
    );
  }

  _pushSavedWordsScene() {
    final savedWordsScene = _buildSavedWordsScene();
    Navigator.of(context).push(savedWordsScene);
  }

  _buildSavedWordsScene() =>
      SavedWordsScene.build(_savedWordsList, _biggerFont);

  _buildRandomWordListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, listViewIndex) {
        return listViewIndex.isOdd
            ? Divider()
            : _buildRandomWordRowAfterProcessing(listViewIndex);
      },
    );
  }

  _buildRandomWordRowAfterProcessing(int listViewIndex) {
    final scrollIndex = _getScrollIndexFromListViewIndex(listViewIndex);
    _addTenWordsToRandomWordListIfScrolledToListEnd(scrollIndex);
    return _buildRow(_randomWordList[scrollIndex]);
  }

  _getScrollIndexFromListViewIndex(int listViewIndex) => listViewIndex ~/ 2;

  _addTenWordsToRandomWordListIfScrolledToListEnd(int scrollIndex) {
    if (_didScrollToEndOfRandomWordList(scrollIndex))
      _addTenWordsToRandomWordList();
  }

  _didScrollToEndOfRandomWordList(int scrollIndex) =>
      scrollIndex >= _randomWordList.length;

  _addTenWordsToRandomWordList() =>
      _randomWordList.addAll(generateWordPairs().take(10));

  _buildRow(WordPair pair) {
    final bool alreadySaved = _savedWordsList.contains(pair);
    return ListTile(
        title: _buildStyledText(pair),
        trailing: _buildTrailingIconAccordingTo(alreadySaved),
        onTap: () => _toggleSavedWord(pair, alreadySaved));
  }

  _buildStyledText(pair) {
    return Text(
      pair.asPascalCase,
      style: _biggerFont,
    );
  }

  _buildTrailingIconAccordingTo(alreadySaved) {
    return new Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
    );
  }

  _toggleSavedWord(pair, alreadySaved) {
    setState(() {
      alreadySaved ? _savedWordsList.remove(pair) : _savedWordsList.add(pair);
    });
  }
}
