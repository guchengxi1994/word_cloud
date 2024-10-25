import 'dart:math';

import 'package:flutter/material.dart';

const double _kFactor = 1.3;

class ArchimedeanWordCloudDelegate extends MultiChildLayoutDelegate {
  final List<Map<String, dynamic>> words;
  final List<Rect> positionedRects = []; // 记录已放置的单词区域
  ArchimedeanWordCloudDelegate(this.words);

  @override
  void performLayout(Size size) {
    assert(size.width > 0 && size.height > 0);
    assert(words.isNotEmpty);

    double angle = 100;
    const double radiusIncrementFactor = 100; // 控制每次半径递增大小
    double angleIncrementFactor = pi * 2 / words.length; // 控制角度递增大小

    for (int i = 0; i < words.length; i++) {
      var word = words[i];
      double radius = radiusIncrementFactor * sqrt(i + 1);
      bool hasCollision;
      Rect wordRect;

      // 通过TextPainter来测量文本大小
      TextPainter painter = TextPainter(
        text: TextSpan(
          text: word['text'],
          style: TextStyle(fontSize: word['fontSize'] * 1.0),
        ),
        textDirection: TextDirection.ltr,
      );
      painter.layout();

      // 持续尝试找到不重叠的位置
      do {
        hasCollision = false;

        // 使用阿基米德螺线方程计算单词的位置
        double x = size.width / 2 + radius * cos(angle);
        double y = size.height / 2 + radius * sin(angle);

        // 计算单词的矩形区域
        wordRect = Rect.fromLTWH(
          x.clamp(0.0, size.width - painter.width),
          y.clamp(0.0, size.height - painter.height),
          painter.width,
          painter.height,
        );

        // 检查是否与已布局的矩形发生碰撞
        for (final placedRect in positionedRects) {
          if (placedRect.overlaps(wordRect)) {
            hasCollision = true;
            break;
          }
        }

        if (hasCollision) {
          // 若发生碰撞，更新角度和半径
          angle += angleIncrementFactor * _kFactor;
          radius += 2.0;
        }
      } while (hasCollision); // 如果发生碰撞，继续寻找新位置

      // 无碰撞，布局单词并记录已布局区域
      if (hasChild(word['text'])) {
        positionedRects.add(wordRect);
        positionChild(word['text'], Offset(wordRect.left, wordRect.top));
        layoutChild(word['text'], BoxConstraints.loose(size));
      }
    }
  }

  @override
  bool shouldRelayout(covariant ArchimedeanWordCloudDelegate oldDelegate) {
    return oldDelegate.words != words;
  }
}
