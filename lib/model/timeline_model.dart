import 'package:flutter/material.dart';

class MyTimeLineModel {
  MyTimeLineModel({
    this.title,
    required this.label,
    this.color = Colors.grey,
  });
  final String label;
  String? title;
  Color color;
}
