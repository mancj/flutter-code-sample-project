import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

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
class IngredientDetails with _$IngredientDetails {
  const factory IngredientDetails({
    String? localizedName,
    int? id,
    String? original,
    String? originalName,
    String? name,
    double? amount,
    String? unit,
    String? unitShort,
    String? unitLong,
    List<String>? possibleUnits,
    EstimatedCost? estimatedCost,
    String? consistency,
    List<String>? shoppingListUnits,
    String? aisle,
    String? image,
    List<String>? meta,
    Nutrition? nutrition,
    List<String>? categoryPath,
  }) = _IngredientDetails;

  factory IngredientDetails.fromJson(Map<String, dynamic> json) => _$IngredientDetailsFromJson(json);
}

@freezed
class EstimatedCost with _$EstimatedCost {
  const factory EstimatedCost({
    double? value,
    String? unit,
  }) = _EstimatedCost;

  factory EstimatedCost.fromJson(Map<String, dynamic> json) => _$EstimatedCostFromJson(json);
}

@freezed
class Nutrition with _$Nutrition {
  const factory Nutrition({
    List<Nutrient>? nutrients,
    List<Property>? properties,
    List<Flavonoid>? flavonoids,
    CaloricBreakdown? caloricBreakdown,
    WeightPerServing? weightPerServing,
  }) = _Nutrition;

  factory Nutrition.fromJson(Map<String, dynamic> json) => _$NutritionFromJson(json);
}

@freezed
class Nutrient with _$Nutrient {
  const factory Nutrient({
    String? name,
    double? amount,
    String? unit,
    double? percentOfDailyNeeds,
  }) = _Nutrient;

  factory Nutrient.fromJson(Map<String, dynamic> json) => _$NutrientFromJson(json);
}

@freezed
class Property with _$Property {
  const factory Property({
    String? name,
    double? amount,
    String? unit,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);
}

@freezed
class Flavonoid with _$Flavonoid {
  const factory Flavonoid({
    String? name,
    double? amount,
    String? unit,
  }) = _Flavonoid;

  factory Flavonoid.fromJson(Map<String, dynamic> json) => _$FlavonoidFromJson(json);
}

@freezed
class CaloricBreakdown with _$CaloricBreakdown {
  const factory CaloricBreakdown({
    double? percentProtein,
    double? percentFat,
    double? percentCarbs,
  }) = _CaloricBreakdown;

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) => _$CaloricBreakdownFromJson(json);
}

@freezed
class WeightPerServing with _$WeightPerServing {
  const factory WeightPerServing({
    double? amount,
    String? unit,
  }) = _WeightPerServing;

  factory WeightPerServing.fromJson(Map<String, dynamic> json) => _$WeightPerServingFromJson(json);
}

