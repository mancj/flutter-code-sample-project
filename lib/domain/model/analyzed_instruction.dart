import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analyzed_instruction.g.dart';

part 'analyzed_instruction.freezed.dart';

@freezed
class AnalyzedInstruction with _$AnalyzedInstruction {
  const factory AnalyzedInstruction({
    required String name,
    required List<RecipeStep> steps,
  }) = _AnalyzedInstruction;

  factory AnalyzedInstruction.fromJson(dynamic json) => _$AnalyzedInstructionFromJson(json);

}


