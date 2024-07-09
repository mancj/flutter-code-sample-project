// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analyzed_instruction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyzedInstruction _$AnalyzedInstructionFromJson(Map<String, dynamic> json) {
  return _AnalyzedInstruction.fromJson(json);
}

/// @nodoc
mixin _$AnalyzedInstruction {
  String get name => throw _privateConstructorUsedError;
  List<RecipeStep> get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyzedInstructionCopyWith<AnalyzedInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzedInstructionCopyWith<$Res> {
  factory $AnalyzedInstructionCopyWith(
          AnalyzedInstruction value, $Res Function(AnalyzedInstruction) then) =
      _$AnalyzedInstructionCopyWithImpl<$Res, AnalyzedInstruction>;
  @useResult
  $Res call({String name, List<RecipeStep> steps});
}

/// @nodoc
class _$AnalyzedInstructionCopyWithImpl<$Res, $Val extends AnalyzedInstruction>
    implements $AnalyzedInstructionCopyWith<$Res> {
  _$AnalyzedInstructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyzedInstructionImplCopyWith<$Res>
    implements $AnalyzedInstructionCopyWith<$Res> {
  factory _$$AnalyzedInstructionImplCopyWith(_$AnalyzedInstructionImpl value,
          $Res Function(_$AnalyzedInstructionImpl) then) =
      __$$AnalyzedInstructionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<RecipeStep> steps});
}

/// @nodoc
class __$$AnalyzedInstructionImplCopyWithImpl<$Res>
    extends _$AnalyzedInstructionCopyWithImpl<$Res, _$AnalyzedInstructionImpl>
    implements _$$AnalyzedInstructionImplCopyWith<$Res> {
  __$$AnalyzedInstructionImplCopyWithImpl(_$AnalyzedInstructionImpl _value,
      $Res Function(_$AnalyzedInstructionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? steps = null,
  }) {
    return _then(_$AnalyzedInstructionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyzedInstructionImpl implements _AnalyzedInstruction {
  const _$AnalyzedInstructionImpl(
      {required this.name, required final List<RecipeStep> steps})
      : _steps = steps;

  factory _$AnalyzedInstructionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyzedInstructionImplFromJson(json);

  @override
  final String name;
  final List<RecipeStep> _steps;
  @override
  List<RecipeStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'AnalyzedInstruction(name: $name, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyzedInstructionImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyzedInstructionImplCopyWith<_$AnalyzedInstructionImpl> get copyWith =>
      __$$AnalyzedInstructionImplCopyWithImpl<_$AnalyzedInstructionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyzedInstructionImplToJson(
      this,
    );
  }
}

abstract class _AnalyzedInstruction implements AnalyzedInstruction {
  const factory _AnalyzedInstruction(
      {required final String name,
      required final List<RecipeStep> steps}) = _$AnalyzedInstructionImpl;

  factory _AnalyzedInstruction.fromJson(Map<String, dynamic> json) =
      _$AnalyzedInstructionImpl.fromJson;

  @override
  String get name;
  @override
  List<RecipeStep> get steps;
  @override
  @JsonKey(ignore: true)
  _$$AnalyzedInstructionImplCopyWith<_$AnalyzedInstructionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
