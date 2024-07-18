import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoonacular_error.freezed.dart';

part 'spoonacular_error.g.dart';

@freezed
class SpoonacularError with _$SpoonacularError {
  const factory SpoonacularError({
    required String status,
    required int code,
    required String message,
  }) = _SpoonacularError;

  factory SpoonacularError.fromJson(dynamic json) => _$SpoonacularErrorFromJson(json);
}
