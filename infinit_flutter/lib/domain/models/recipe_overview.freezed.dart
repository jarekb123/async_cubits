// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeOverview {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Create a copy of RecipeOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeOverviewCopyWith<RecipeOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeOverviewCopyWith<$Res> {
  factory $RecipeOverviewCopyWith(
          RecipeOverview value, $Res Function(RecipeOverview) then) =
      _$RecipeOverviewCopyWithImpl<$Res, RecipeOverview>;
  @useResult
  $Res call({String id, String title, String? imageUrl, List<String> tags});
}

/// @nodoc
class _$RecipeOverviewCopyWithImpl<$Res, $Val extends RecipeOverview>
    implements $RecipeOverviewCopyWith<$Res> {
  _$RecipeOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? tags = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeOverviewImplCopyWith<$Res>
    implements $RecipeOverviewCopyWith<$Res> {
  factory _$$RecipeOverviewImplCopyWith(_$RecipeOverviewImpl value,
          $Res Function(_$RecipeOverviewImpl) then) =
      __$$RecipeOverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String? imageUrl, List<String> tags});
}

/// @nodoc
class __$$RecipeOverviewImplCopyWithImpl<$Res>
    extends _$RecipeOverviewCopyWithImpl<$Res, _$RecipeOverviewImpl>
    implements _$$RecipeOverviewImplCopyWith<$Res> {
  __$$RecipeOverviewImplCopyWithImpl(
      _$RecipeOverviewImpl _value, $Res Function(_$RecipeOverviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? tags = null,
  }) {
    return _then(_$RecipeOverviewImpl(
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
    ));
  }
}

/// @nodoc

class _$RecipeOverviewImpl implements _RecipeOverview {
  const _$RecipeOverviewImpl(
      {required this.id,
      required this.title,
      this.imageUrl,
      required final List<String> tags})
      : _tags = tags;

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
  String toString() {
    return 'RecipeOverview(id: $id, title: $title, imageUrl: $imageUrl, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeOverviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, imageUrl,
      const DeepCollectionEquality().hash(_tags));

  /// Create a copy of RecipeOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeOverviewImplCopyWith<_$RecipeOverviewImpl> get copyWith =>
      __$$RecipeOverviewImplCopyWithImpl<_$RecipeOverviewImpl>(
          this, _$identity);
}

abstract class _RecipeOverview implements RecipeOverview {
  const factory _RecipeOverview(
      {required final String id,
      required final String title,
      final String? imageUrl,
      required final List<String> tags}) = _$RecipeOverviewImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get imageUrl;
  @override
  List<String> get tags;

  /// Create a copy of RecipeOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeOverviewImplCopyWith<_$RecipeOverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
