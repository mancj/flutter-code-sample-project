import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_step.freezed.dart';
part 'recipe_step.g.dart';

@freezed
class RecipeStep with _$RecipeStep {
  const factory RecipeStep({
    required int number,
    required String step,
    required List<Ingredient> ingredients,
    required List<Equipment> equipment,
  }) = _RecipeStep;

  factory RecipeStep.fromJson(Map<String, dynamic> json) => _$RecipeStepFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required int id,
    required String name,
    required String localizedName,
    required String image,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}

@freezed
class Equipment with _$Equipment {
  const factory Equipment({
    required int id,
    required String name,
    required String localizedName,
    required String image,
  }) = _Equipment;

  factory Equipment.fromJson(Map<String, dynamic> json) => _$EquipmentFromJson(json);
}
