// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeResultsImpl _$$RecipeResultsImplFromJson(Map<String, dynamic> json) =>
    _$RecipeResultsImpl(
      results: (json['results'] as List<dynamic>).map(Recipe.fromJson).toList(),
    );

Map<String, dynamic> _$$RecipeResultsImplToJson(_$RecipeResultsImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

_$RecipesHolderResultsImpl _$$RecipesHolderResultsImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipesHolderResultsImpl(
      recipes: (json['recipes'] as List<dynamic>).map(Recipe.fromJson).toList(),
    );

Map<String, dynamic> _$$RecipesHolderResultsImplToJson(
        _$RecipesHolderResultsImpl instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
    };

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      readyInMinutes: (json['readyInMinutes'] as num).toInt(),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'readyInMinutes': instance.readyInMinutes,
    };
