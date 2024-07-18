import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/resources/ui_paddings.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:get/get.dart';

void showUnimplementedDialog() {
  Get.dialog(
    const Dialog(
      child: WIPDialog(),
    ),
  );
}

class WIPDialog extends StatelessWidget {
  const WIPDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Work in progress',
            style: UITextStyles.boldLabel,
          ),
          const UIMargin.vertical16(),
          Row(
            children: [
              Image.asset(
                UIImages.work_in_progress,
                height: 60,
              ),
              const UIMargin.horizontal(padding16),
              const Expanded(
                child: Text(
                  'Sorry, this feature is not implemented yet',
                  style: UITextStyles.regularSmall,
                ),
              ),
            ],
          ),
          const UIMargin.vertical(padding24),
          const UIMargin.vertical8(),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: Get.back,
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}
