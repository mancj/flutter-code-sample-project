import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:get/get.dart';

class IngredientsList extends StatelessWidget {
  final String imageURL;
  final List<Ingredient> ingredients;
  final Function(Ingredient) onTapIngredient;

  const IngredientsList({
    super.key,
    required this.ingredients,
    required this.onTapIngredient,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: padding16),
      itemBuilder: (context, index) {
        var ingredient = ingredients[index];
        return _ingredientWidget(ingredient);
      },
      itemCount: ingredients.length,
    );
  }

  Widget _ingredientWidget(Ingredient ingredient) {
    return TransparentGestureDetector(
      onTap: () => onTapIngredient(ingredient),
      child: Container(
        margin: const EdgeInsets.only(bottom: padding12),
        padding: const EdgeInsets.all(padding16),
        decoration: BoxDecoration(
          color: UIColors.neutral5,
          borderRadius: BorderRadius.circular(padding12),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              padding: const EdgeInsets.all(padding8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(padding12),
                color: UIColors.white,
              ),
              child: CachedNetworkImage(
                imageUrl: '${imageURL}/${ingredient.image}',
                fit: BoxFit.contain,
                fadeInDuration: 100.milliseconds,
              ),
            ),
            const UIMargin.horizontal(padding8),
            Text(
              ingredient.name.capitalizeFirst!,
              style: UITextStyles.boldLabel,
            ),
          ],
        ),
      ),
    );
  }
}
