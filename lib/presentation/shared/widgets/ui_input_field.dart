import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/resources/ui_colors.dart';

class UIInputField extends StatelessWidget {
  final Function(String v)? onSubmitted;

  const UIInputField({
    super.key,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: 18,
            color: UIColors.neutral30,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: UIColors.neutral20),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: UIColors.neutral30),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: padding24,
            vertical: padding12,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: UIColors.hintText,
          ),
        ),
      ),
    );
  }
}
