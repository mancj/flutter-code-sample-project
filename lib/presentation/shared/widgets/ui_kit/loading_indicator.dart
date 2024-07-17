import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/resources/ui_images.dart';

class LoadingIndicator extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageAsset;

  const LoadingIndicator({
    super.key,
    required this.title,
    this.imageAsset,
    this.subtitle = 'Please wait',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset ?? UIImages.vegan_food,
            fit: BoxFit.scaleDown,
            height: 100,
          ),
          Text(
            title,
            style: UITextStyles.boldLabel,
          ),
          Text(
            subtitle,
            style: UITextStyles.regularSmall.copyWith(color: UIColors.black60),
          )
        ],
      ),
    );
  }
}
