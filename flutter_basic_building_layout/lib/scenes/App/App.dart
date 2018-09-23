import 'package:flutter/material.dart';
import 'package:flutter_basic_building_layout/scenes/App/components/MainCover.dart';
import 'package:flutter_basic_building_layout/scenes/App/components/ButtonSection.dart';
import 'package:flutter_basic_building_layout/scenes/App/components/TextSection.dart';
import 'package:flutter_basic_building_layout/scenes/App/components/TitleSection.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: [
            MainCover(),
            TitleSection(),
            ButtonSection(),
            TextSection(),
          ],
        ),
      ),
    );
  }
}
