import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:get/get.dart';

import 'splash_screen_controller.dart';

export 'splash_screen_binding.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  static const routeName = '/splash_screen';

  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              UIImages.sample,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UIMargin.vertical16(),
                _topTitleWidget(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(padding16),
                  child: Text(
                    'Let\'s cooking',
                    style: UITextStyles.boldHeading.copyWith(
                      color: UIColors.white,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(padding16),
                  child: Text(
                    'Find best recipes for cooking',
                    style: UITextStyles.regularParagraph.copyWith(
                      color: UIColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const UIMargin.vertical(32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topTitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: UIColors.white,
        ),
        const UIMargin.horizontal(8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '60k+ ',
                style: UITextStyles.boldLabel.copyWith(
                  color: UIColors.white,
                ),
              ),
              TextSpan(
                text: 'Premium recipes',
                style: UITextStyles.regularParagraph.copyWith(
                  color: UIColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
