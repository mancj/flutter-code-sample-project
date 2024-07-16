import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoConnectionPage extends StatelessWidget {
  static const routeName = '/no_connection';
  final Function() onRetry;

  const NoConnectionPage({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(UISVGAssets.no_wifi, width: 56, color: UIColors.neutral30),
            const UIMargin.vertical8(),
            const Text("No Internet Connection", style: UITextStyles.boldH5),
            const UIMargin.vertical8(),
            const Text(
              "Please check your internet connection and try again.",
              style: UITextStyles.regularLabel,
              textAlign: TextAlign.center,
            ),
            const UIMargin.vertical(padding32),
            FilledButton(onPressed: onRetry, child: const Text('To main page')),
          ],
        ),
      ),
    );
  }
}
