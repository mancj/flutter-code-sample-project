// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analyzed_instruction_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyzedInstructionStep _$AnalyzedInstructionStepFromJson(
    Map<String, dynamic> json) {
  return _AnalyzedInstructionStep.fromJson(json);
}

/// @nodoc
mixin _$AnalyzedInstructionStep {
  dynamic get field => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyzedInstructionStepCopyWith<AnalyzedInstructionStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzedInstructionStepCopyWith<$Res> {
  factory $AnalyzedInstructionStepCopyWith(AnalyzedInstructionStep value,
          $Res Function(AnalyzedInstructionStep) then) =
      _$AnalyzedInstructionStepCopyWithImpl<$Res, AnalyzedInstructionStep>;
  @useResult
  $Res call({dynamic field});
}

/// @nodoc
class _$AnalyzedInstructionStepCopyWithImpl<$Res,
        $Val extends AnalyzedInstructionStep>
    implements $AnalyzedInstructionStepCopyWith<$Res> {
  _$AnalyzedInstructionStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = freezed,
  }) {
    return _then(_value.copyWith(
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyzedInstructionStepImplCopyWith<$Res>
    implements $AnalyzedInstructionStepCopyWith<$Res> {
  factory _$$AnalyzedInstructionStepImplCopyWith(
          _$AnalyzedInstructionStepImpl value,
          $Res Function(_$AnalyzedInstructionStepImpl) then) =
      __$$AnalyzedInstructionStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic field});
}

/// @nodoc
class __$$AnalyzedInstructionStepImplCopyWithImpl<$Res>
    extends _$AnalyzedInstructionStepCopyWithImpl<$Res,
        _$AnalyzedInstructionStepImpl>
    implements _$$AnalyzedInstructionStepImplCopyWith<$Res> {
  __$$AnalyzedInstructionStepImplCopyWithImpl(
      _$AnalyzedInstructionStepImpl _value,
      $Res Function(_$AnalyzedInstructionStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = freezed,
  }) {
    return _then(_$AnalyzedInstructionStepImpl(
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyzedInstructionStepImpl implements _AnalyzedInstructionStep {
  const _$AnalyzedInstructionStepImpl({required this.field});

  factory _$AnalyzedInstructionStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyzedInstructionStepImplFromJson(json);

  @override
  final dynamic field;

  @override
  String toString() {
    return 'AnalyzedInstructionStep(field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyzedInstructionStepImpl &&
            const DeepCollectionEquality().equals(other.field, field));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyzedInstructionStepImplCopyWith<_$AnalyzedInstructionStepImpl>
      get copyWith => __$$AnalyzedInstructionStepImplCopyWithImpl<
          _$AnalyzedInstructionStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyzedInstructionStepImplToJson(
      this,
    );
  }
}

abstract class _AnalyzedInstructionStep implements AnalyzedInstructionStep {
  const factory _AnalyzedInstructionStep({required final dynamic field}) =
      _$AnalyzedInstructionStepImpl;

  factory _AnalyzedInstructionStep.fromJson(Map<String, dynamic> json) =
      _$AnalyzedInstructionStepImpl.fromJson;

  @override
  dynamic get field;
  @override
  @JsonKey(ignore: true)
  _$$AnalyzedInstructionStepImplCopyWith<_$AnalyzedInstructionStepImpl>
      get copyWith => throw _privateConstructorUsedError;
}
