import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:get/get.dart';

class UIPageTitle extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  final bool showBackButton;

  const UIPageTitle({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBackButton)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: Get.back,
              child: const Padding(
                padding: EdgeInsets.all(padding8),
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          Flexible(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: UITextStyles.boldH4,
            ),
          ),
        ],
      ),
    );
  }
}
