// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_details_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeDetailsPageArgs {
  Recipe get recipe => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeDetailsPageArgsCopyWith<RecipeDetailsPageArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDetailsPageArgsCopyWith<$Res> {
  factory $RecipeDetailsPageArgsCopyWith(RecipeDetailsPageArgs value,
          $Res Function(RecipeDetailsPageArgs) then) =
      _$RecipeDetailsPageArgsCopyWithImpl<$Res, RecipeDetailsPageArgs>;
  @useResult
  $Res call({Recipe recipe});

  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class _$RecipeDetailsPageArgsCopyWithImpl<$Res,
        $Val extends RecipeDetailsPageArgs>
    implements $RecipeDetailsPageArgsCopyWith<$Res> {
  _$RecipeDetailsPageArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
  }) {
    return _then(_value.copyWith(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<$Res> get recipe {
    return $RecipeCopyWith<$Res>(_value.recipe, (value) {
      return _then(_value.copyWith(recipe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeDetailsPageArgsImplCopyWith<$Res>
    implements $RecipeDetailsPageArgsCopyWith<$Res> {
  factory _$$RecipeDetailsPageArgsImplCopyWith(
          _$RecipeDetailsPageArgsImpl value,
          $Res Function(_$RecipeDetailsPageArgsImpl) then) =
      __$$RecipeDetailsPageArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Recipe recipe});

  @override
  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class __$$RecipeDetailsPageArgsImplCopyWithImpl<$Res>
    extends _$RecipeDetailsPageArgsCopyWithImpl<$Res,
        _$RecipeDetailsPageArgsImpl>
    implements _$$RecipeDetailsPageArgsImplCopyWith<$Res> {
  __$$RecipeDetailsPageArgsImplCopyWithImpl(_$RecipeDetailsPageArgsImpl _value,
      $Res Function(_$RecipeDetailsPageArgsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
  }) {
    return _then(_$RecipeDetailsPageArgsImpl(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
    ));
  }
}

/// @nodoc

class _$RecipeDetailsPageArgsImpl implements _RecipeDetailsPageArgs {
  const _$RecipeDetailsPageArgsImpl({required this.recipe});

  @override
  final Recipe recipe;

  @override
  String toString() {
    return 'RecipeDetailsPageArgs(recipe: $recipe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeDetailsPageArgsImpl &&
            (identical(other.recipe, recipe) || other.recipe == recipe));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeDetailsPageArgsImplCopyWith<_$RecipeDetailsPageArgsImpl>
      get copyWith => __$$RecipeDetailsPageArgsImplCopyWithImpl<
          _$RecipeDetailsPageArgsImpl>(this, _$identity);
}

abstract class _RecipeDetailsPageArgs implements RecipeDetailsPageArgs {
  const factory _RecipeDetailsPageArgs({required final Recipe recipe}) =
      _$RecipeDetailsPageArgsImpl;

  @override
  Recipe get recipe;
  @override
  @JsonKey(ignore: true)
  _$$RecipeDetailsPageArgsImplCopyWith<_$RecipeDetailsPageArgsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
