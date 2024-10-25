library;

import 'package:flutter/material.dart';
import 'package:word_cloud/tools.dart';

import 'archimedean_word_cloud_delegate.dart';

class WordCloud extends StatelessWidget {
  final List<Map<String, dynamic>> words;

  const WordCloud({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: ArchimedeanWordCloudDelegate(words),
      children: words.map((word) {
        return LayoutId(
          id: word['text'],
          child: Text(
            word['text'],
            style: TextStyle(
                fontSize: word['fontSize'] * 1.0,
                color: HexColor(word['color'])),
          ),
        );
      }).toList(),
    );
  }
}
