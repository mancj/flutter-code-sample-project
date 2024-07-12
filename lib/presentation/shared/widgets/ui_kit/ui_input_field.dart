import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';

class UIInputField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String v)? onSubmitted;
  final String hintText;

  const UIInputField({
    super.key,
    this.onSubmitted,
    this.hintText = 'Search',
    this.controller,
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
        controller: controller,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
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
