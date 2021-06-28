import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget dotWidget(int page, int index) {
  final double selectedness = Curves.easeOut.transform(
    max(
      0.0,
      1.0 - ((page ?? 0) - index).abs(),
    ),
  );
  final double zoom = 1.0 + (2.0 - 1.0) * selectedness;
  return SizedBox(
    width: 25.0,
    child: Center(
      child: Material(
        color: Colors.white,
        type: MaterialType.circle,
        child: SizedBox(
          width: 8.0 * zoom,
          height: 8.0 * zoom,
        ),
      ),
    ),
  );
}