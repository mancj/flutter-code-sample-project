import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/ui_kit/unimplemented_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/_ui_resources.dart';

class RecipeCardSmall extends StatelessWidget {
  final Recipe recipe;

  const RecipeCardSmall(this.recipe, {super.key});

  static Widget shimmer() {
    return Shimmer.fromColors(
      baseColor: UIColors.neutral10,
      highlightColor: UIColors.neutral20,
      child: Container(
        margin: const EdgeInsets.only(right: padding16),
        width: 200,
        decoration: BoxDecoration(
          color: UIColors.neutral20,
          borderRadius: BorderRadius.circular(padding12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: padding12),
      width: 200,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
              color: UIColors.neutral10,
              borderRadius: BorderRadius.circular(padding12),
            ),
            padding: const EdgeInsets.fromLTRB(padding12, 90, padding12, padding12),
            child: Column(
              children: [
                Text(
                  recipe.title,
                  style: UITextStyles.boldLabel,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Time',
                    style: UITextStyles.regularSmall.copyWith(
                      color: UIColors.neutral30,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${recipe.readyInMinutes} mins',
                      style: UITextStyles.boldSmall,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: showUnimplementedDialog,
                      child: SvgPicture.asset(
                        UISVGAssets.bookmark,
                        height: 42,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          _recipeImageWidget(),
        ],
      ),
    );
  }

  Widget _recipeImageWidget() {
    return Container(
      width: 140,
      height: 140,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        gradient: LinearGradient(
          colors: [
            UIColors.neutral30,
            UIColors.neutral10,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(padding12),
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
        ),
        child: recipe.image != null
            ? CachedNetworkImage(
                imageUrl: recipe.image!,
                fit: BoxFit.cover,
              )
            : SvgPicture.asset(
                UISVGAssets.salad,
                height: 56,
                width: 56,
                color: UIColors.primary,
              ),
      ),
    );
  }
}
