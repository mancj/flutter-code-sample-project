import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';

class UIMargin extends StatelessWidget {
  final double horizontal;
  final double vertical;

  const UIMargin({super.key, required this.horizontal, required this.vertical});

  const UIMargin.vertical(this.vertical, {super.key}) : horizontal = 0;

  const UIMargin.vertical16({super.key})
      : horizontal = 0,
        vertical = padding16;

  const UIMargin.vertical12({super.key})
      : horizontal = 0,
        vertical = padding12;

  const UIMargin.vertical8({super.key})
      : horizontal = 0,
        vertical = padding8;

  const UIMargin.horizontal(this.horizontal, {super.key}) : vertical = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: horizontal,
      height: vertical,
    );
  }
}
