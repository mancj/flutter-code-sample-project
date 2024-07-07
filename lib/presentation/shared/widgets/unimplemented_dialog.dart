import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/shared/resources/ui_paddings.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:get/get.dart';

void showUnimplementedDialog() {
  Get.dialog(
    Dialog(
      child: Padding(
        padding: const EdgeInsets.all(padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('This feature is not implemented yet'),
            const UIMargin.vertical(padding24),
            FilledButton(
              onPressed: Get.back,
              child: Text('Close'),
            ),
          ],
        ),
      ),
    ),
  );
}
