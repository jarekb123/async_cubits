// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeDetails {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Ingeredient> get ingredients => throw _privateConstructorUsedError;

  /// Create a copy of RecipeDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeDetailsCopyWith<RecipeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDetailsCopyWith<$Res> {
  factory $RecipeDetailsCopyWith(
          RecipeDetails value, $Res Function(RecipeDetails) then) =
      _$RecipeDetailsCopyWithImpl<$Res, RecipeDetails>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? imageUrl,
      List<String> tags,
      String description,
      List<Ingeredient> ingredients});
}

/// @nodoc
class _$RecipeDetailsCopyWithImpl<$Res, $Val extends RecipeDetails>
    implements $RecipeDetailsCopyWith<$Res> {
  _$RecipeDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? tags = null,
    Object? description = null,
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingeredient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeDetailsImplCopyWith<$Res>
    implements $RecipeDetailsCopyWith<$Res> {
  factory _$$RecipeDetailsImplCopyWith(
          _$RecipeDetailsImpl value, $Res Function(_$RecipeDetailsImpl) then) =
      __$$RecipeDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? imageUrl,
      List<String> tags,
      String description,
      List<Ingeredient> ingredients});
}

/// @nodoc
class __$$RecipeDetailsImplCopyWithImpl<$Res>
    extends _$RecipeDetailsCopyWithImpl<$Res, _$RecipeDetailsImpl>
    implements _$$RecipeDetailsImplCopyWith<$Res> {
  __$$RecipeDetailsImplCopyWithImpl(
      _$RecipeDetailsImpl _value, $Res Function(_$RecipeDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? tags = null,
    Object? description = null,
    Object? ingredients = null,
  }) {
    return _then(_$RecipeDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingeredient>,
    ));
  }
}

/// @nodoc

class _$RecipeDetailsImpl implements _RecipeDetails {
  const _$RecipeDetailsImpl(
      {required this.id,
      required this.title,
      this.imageUrl,
      required final List<String> tags,
      required this.description,
      required final List<Ingeredient> ingredients})
      : _tags = tags,
        _ingredients = ingredients;

  @override
  final String id;
  @override
  final String title;
  @override
  final String? imageUrl;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String description;
  final List<Ingeredient> _ingredients;
  @override
  List<Ingeredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'RecipeDetails(id: $id, title: $title, imageUrl: $imageUrl, tags: $tags, description: $description, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      imageUrl,
      const DeepCollectionEquality().hash(_tags),
      description,
      const DeepCollectionEquality().hash(_ingredients));

  /// Create a copy of RecipeDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeDetailsImplCopyWith<_$RecipeDetailsImpl> get copyWith =>
      __$$RecipeDetailsImplCopyWithImpl<_$RecipeDetailsImpl>(this, _$identity);
}

abstract class _RecipeDetails implements RecipeDetails {
  const factory _RecipeDetails(
      {required final String id,
      required final String title,
      final String? imageUrl,
      required final List<String> tags,
      required final String description,
      required final List<Ingeredient> ingredients}) = _$RecipeDetailsImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get imageUrl;
  @override
  List<String> get tags;
  @override
  String get description;
  @override
  List<Ingeredient> get ingredients;

  /// Create a copy of RecipeDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeDetailsImplCopyWith<_$RecipeDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Ingeredient {
  String get name => throw _privateConstructorUsedError;
  String get measure => throw _privateConstructorUsedError;

  /// Create a copy of Ingeredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngeredientCopyWith<Ingeredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngeredientCopyWith<$Res> {
  factory $IngeredientCopyWith(
          Ingeredient value, $Res Function(Ingeredient) then) =
      _$IngeredientCopyWithImpl<$Res, Ingeredient>;
  @useResult
  $Res call({String name, String measure});
}

/// @nodoc
class _$IngeredientCopyWithImpl<$Res, $Val extends Ingeredient>
    implements $IngeredientCopyWith<$Res> {
  _$IngeredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ingeredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? measure = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      measure: null == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngeredientImplCopyWith<$Res>
    implements $IngeredientCopyWith<$Res> {
  factory _$$IngeredientImplCopyWith(
          _$IngeredientImpl value, $Res Function(_$IngeredientImpl) then) =
      __$$IngeredientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String measure});
}

/// @nodoc
class __$$IngeredientImplCopyWithImpl<$Res>
    extends _$IngeredientCopyWithImpl<$Res, _$IngeredientImpl>
    implements _$$IngeredientImplCopyWith<$Res> {
  __$$IngeredientImplCopyWithImpl(
      _$IngeredientImpl _value, $Res Function(_$IngeredientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ingeredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? measure = null,
  }) {
    return _then(_$IngeredientImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      measure: null == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IngeredientImpl implements _Ingeredient {
  const _$IngeredientImpl({required this.name, required this.measure});

  @override
  final String name;
  @override
  final String measure;

  @override
  String toString() {
    return 'Ingeredient(name: $name, measure: $measure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngeredientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.measure, measure) || other.measure == measure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, measure);

  /// Create a copy of Ingeredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngeredientImplCopyWith<_$IngeredientImpl> get copyWith =>
      __$$IngeredientImplCopyWithImpl<_$IngeredientImpl>(this, _$identity);
}

abstract class _Ingeredient implements Ingeredient {
  const factory _Ingeredient(
      {required final String name,
      required final String measure}) = _$IngeredientImpl;

  @override
  String get name;
  @override
  String get measure;

  /// Create a copy of Ingeredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngeredientImplCopyWith<_$IngeredientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
