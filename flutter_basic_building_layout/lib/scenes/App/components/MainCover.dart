import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainCover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/lake.jpg',
      width: 600.0,
      height: 240.0,
      fit: BoxFit.cover,
    );
  }
}
