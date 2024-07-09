// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyzed_instruction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyzedInstructionImpl _$$AnalyzedInstructionImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyzedInstructionImpl(
      name: json['name'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnalyzedInstructionImplToJson(
        _$AnalyzedInstructionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'steps': instance.steps,
    };
