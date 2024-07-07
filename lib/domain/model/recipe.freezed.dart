// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeResults _$RecipeResultsFromJson(Map<String, dynamic> json) {
  return _RecipeResults.fromJson(json);
}

/// @nodoc
mixin _$RecipeResults {
  List<Recipe> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeResultsCopyWith<RecipeResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeResultsCopyWith<$Res> {
  factory $RecipeResultsCopyWith(
          RecipeResults value, $Res Function(RecipeResults) then) =
      _$RecipeResultsCopyWithImpl<$Res, RecipeResults>;
  @useResult
  $Res call({List<Recipe> results});
}

/// @nodoc
class _$RecipeResultsCopyWithImpl<$Res, $Val extends RecipeResults>
    implements $RecipeResultsCopyWith<$Res> {
  _$RecipeResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeResultsImplCopyWith<$Res>
    implements $RecipeResultsCopyWith<$Res> {
  factory _$$RecipeResultsImplCopyWith(
          _$RecipeResultsImpl value, $Res Function(_$RecipeResultsImpl) then) =
      __$$RecipeResultsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> results});
}

/// @nodoc
class __$$RecipeResultsImplCopyWithImpl<$Res>
    extends _$RecipeResultsCopyWithImpl<$Res, _$RecipeResultsImpl>
    implements _$$RecipeResultsImplCopyWith<$Res> {
  __$$RecipeResultsImplCopyWithImpl(
      _$RecipeResultsImpl _value, $Res Function(_$RecipeResultsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$RecipeResultsImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeResultsImpl implements _RecipeResults {
  const _$RecipeResultsImpl({required final List<Recipe> results})
      : _results = results;

  factory _$RecipeResultsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeResultsImplFromJson(json);

  final List<Recipe> _results;
  @override
  List<Recipe> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'RecipeResults(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeResultsImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeResultsImplCopyWith<_$RecipeResultsImpl> get copyWith =>
      __$$RecipeResultsImplCopyWithImpl<_$RecipeResultsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeResultsImplToJson(
      this,
    );
  }
}

abstract class _RecipeResults implements RecipeResults {
  const factory _RecipeResults({required final List<Recipe> results}) =
      _$RecipeResultsImpl;

  factory _RecipeResults.fromJson(Map<String, dynamic> json) =
      _$RecipeResultsImpl.fromJson;

  @override
  List<Recipe> get results;
  @override
  @JsonKey(ignore: true)
  _$$RecipeResultsImplCopyWith<_$RecipeResultsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipesHolderResults _$RecipesHolderResultsFromJson(Map<String, dynamic> json) {
  return _RecipesHolderResults.fromJson(json);
}

/// @nodoc
mixin _$RecipesHolderResults {
  List<Recipe> get recipes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipesHolderResultsCopyWith<RecipesHolderResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipesHolderResultsCopyWith<$Res> {
  factory $RecipesHolderResultsCopyWith(RecipesHolderResults value,
          $Res Function(RecipesHolderResults) then) =
      _$RecipesHolderResultsCopyWithImpl<$Res, RecipesHolderResults>;
  @useResult
  $Res call({List<Recipe> recipes});
}

/// @nodoc
class _$RecipesHolderResultsCopyWithImpl<$Res,
        $Val extends RecipesHolderResults>
    implements $RecipesHolderResultsCopyWith<$Res> {
  _$RecipesHolderResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_value.copyWith(
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipesHolderResultsImplCopyWith<$Res>
    implements $RecipesHolderResultsCopyWith<$Res> {
  factory _$$RecipesHolderResultsImplCopyWith(_$RecipesHolderResultsImpl value,
          $Res Function(_$RecipesHolderResultsImpl) then) =
      __$$RecipesHolderResultsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> recipes});
}

/// @nodoc
class __$$RecipesHolderResultsImplCopyWithImpl<$Res>
    extends _$RecipesHolderResultsCopyWithImpl<$Res, _$RecipesHolderResultsImpl>
    implements _$$RecipesHolderResultsImplCopyWith<$Res> {
  __$$RecipesHolderResultsImplCopyWithImpl(_$RecipesHolderResultsImpl _value,
      $Res Function(_$RecipesHolderResultsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_$RecipesHolderResultsImpl(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipesHolderResultsImpl implements _RecipesHolderResults {
  const _$RecipesHolderResultsImpl({required final List<Recipe> recipes})
      : _recipes = recipes;

  factory _$RecipesHolderResultsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipesHolderResultsImplFromJson(json);

  final List<Recipe> _recipes;
  @override
  List<Recipe> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'RecipesHolderResults(recipes: $recipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipesHolderResultsImpl &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipesHolderResultsImplCopyWith<_$RecipesHolderResultsImpl>
      get copyWith =>
          __$$RecipesHolderResultsImplCopyWithImpl<_$RecipesHolderResultsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipesHolderResultsImplToJson(
      this,
    );
  }
}

abstract class _RecipesHolderResults implements RecipesHolderResults {
  const factory _RecipesHolderResults({required final List<Recipe> recipes}) =
      _$RecipesHolderResultsImpl;

  factory _RecipesHolderResults.fromJson(Map<String, dynamic> json) =
      _$RecipesHolderResultsImpl.fromJson;

  @override
  List<Recipe> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$RecipesHolderResultsImplCopyWith<_$RecipesHolderResultsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get readyInMinutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call({int id, String title, String image, int readyInMinutes});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? readyInMinutes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      readyInMinutes: null == readyInMinutes
          ? _value.readyInMinutes
          : readyInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String image, int readyInMinutes});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? readyInMinutes = null,
  }) {
    return _then(_$RecipeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      readyInMinutes: null == readyInMinutes
          ? _value.readyInMinutes
          : readyInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl(
      {required this.id,
      required this.title,
      required this.image,
      required this.readyInMinutes});

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String image;
  @override
  final int readyInMinutes;

  @override
  String toString() {
    return 'Recipe(id: $id, title: $title, image: $image, readyInMinutes: $readyInMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.readyInMinutes, readyInMinutes) ||
                other.readyInMinutes == readyInMinutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, readyInMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final int id,
      required final String title,
      required final String image,
      required final int readyInMinutes}) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get image;
  @override
  int get readyInMinutes;
  @override
  @JsonKey(ignore: true)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
