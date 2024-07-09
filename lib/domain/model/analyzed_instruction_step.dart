import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analyzed_instruction_step.g.dart';

part 'analyzed_instruction_step.freezed.dart';


@freezed
class AnalyzedInstructionStep
    with _$AnalyzedInstructionStep {

  const factory AnalyzedInstructionStep({
    required dynamic field,
  }) = _AnalyzedInstructionStep;

  factory AnalyzedInstructionStep.fromJson(dynamic json) =>
      _$AnalyzedInstructionStepFromJson(json);

}
