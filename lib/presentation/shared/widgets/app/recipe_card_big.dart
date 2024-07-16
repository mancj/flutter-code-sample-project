import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class RecipeCardBig extends StatelessWidget {
  static const _height = 200.0;
  final Recipe recipe;
  final double width;
  final EdgeInsets margin;

  const RecipeCardBig({
    super.key,
    required this.recipe,
    required this.width,
    this.margin = const EdgeInsets.only(right: 16),
  });

  static Widget shimmer(double width) {
    return Shimmer.fromColors(
      baseColor: UIColors.neutral20,
      highlightColor: UIColors.neutral10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: _height - 16,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: UIColors.secondaryText,
            ),
          ),
          UIMargin.vertical12(),
          Container(
            width: 200,
            height: 24,
            margin: const EdgeInsets.only(right: padding12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(padding8),
              color: UIColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        children: [
          SizedBox(
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (recipe.image != null)
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: _height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: UIColors.neutral20,
                    ),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      imageUrl: recipe.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                const UIMargin.vertical12(),
                Text(
                  recipe.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: UITextStyles.boldParagraph,
                ),
              ],
            ),
          ),
          Positioned(
            left: padding12,
            top: padding12,
            child: _cookingTimeWidget(),
          ),
        ],
      ),
    );
  }

  Widget _cookingTimeWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: padding8,
        vertical: padding8,
      ),
      decoration: BoxDecoration(
        color: UIColors.black40,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            UISVGAssets.timer,
            height: 16,
            color: UIColors.white,
          ),
          const UIMargin.horizontal(padding8),
          Text(
            '${recipe.readyInMinutes} min',
            style: UITextStyles.boldLabel.copyWith(
              color: UIColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
