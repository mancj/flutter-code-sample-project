// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_recipes_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchRecipesPageArgs {
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchRecipesPageArgsCopyWith<SearchRecipesPageArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRecipesPageArgsCopyWith<$Res> {
  factory $SearchRecipesPageArgsCopyWith(SearchRecipesPageArgs value,
          $Res Function(SearchRecipesPageArgs) then) =
      _$SearchRecipesPageArgsCopyWithImpl<$Res, SearchRecipesPageArgs>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class _$SearchRecipesPageArgsCopyWithImpl<$Res,
        $Val extends SearchRecipesPageArgs>
    implements $SearchRecipesPageArgsCopyWith<$Res> {
  _$SearchRecipesPageArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchRecipesPageArgsImplCopyWith<$Res>
    implements $SearchRecipesPageArgsCopyWith<$Res> {
  factory _$$SearchRecipesPageArgsImplCopyWith(
          _$SearchRecipesPageArgsImpl value,
          $Res Function(_$SearchRecipesPageArgsImpl) then) =
      __$$SearchRecipesPageArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchRecipesPageArgsImplCopyWithImpl<$Res>
    extends _$SearchRecipesPageArgsCopyWithImpl<$Res,
        _$SearchRecipesPageArgsImpl>
    implements _$$SearchRecipesPageArgsImplCopyWith<$Res> {
  __$$SearchRecipesPageArgsImplCopyWithImpl(_$SearchRecipesPageArgsImpl _value,
      $Res Function(_$SearchRecipesPageArgsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchRecipesPageArgsImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchRecipesPageArgsImpl implements _SearchRecipesPageArgs {
  const _$SearchRecipesPageArgsImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'SearchRecipesPageArgs(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRecipesPageArgsImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRecipesPageArgsImplCopyWith<_$SearchRecipesPageArgsImpl>
      get copyWith => __$$SearchRecipesPageArgsImplCopyWithImpl<
          _$SearchRecipesPageArgsImpl>(this, _$identity);
}

abstract class _SearchRecipesPageArgs implements SearchRecipesPageArgs {
  const factory _SearchRecipesPageArgs({required final String query}) =
      _$SearchRecipesPageArgsImpl;

  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$SearchRecipesPageArgsImplCopyWith<_$SearchRecipesPageArgsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
