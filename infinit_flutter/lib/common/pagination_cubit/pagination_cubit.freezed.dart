// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginationState<PageKey, ItemType> {
  List<ItemType> get items => throw _privateConstructorUsedError;
  PageKey? get nextPageKey => throw _privateConstructorUsedError;
  bool get isFetchingNextPage => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationStateCopyWith<PageKey, ItemType,
          PaginationState<PageKey, ItemType>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<PageKey, ItemType, $Res> {
  factory $PaginationStateCopyWith(PaginationState<PageKey, ItemType> value,
          $Res Function(PaginationState<PageKey, ItemType>) then) =
      _$PaginationStateCopyWithImpl<PageKey, ItemType, $Res,
          PaginationState<PageKey, ItemType>>;
  @useResult
  $Res call(
      {List<ItemType> items,
      PageKey? nextPageKey,
      bool isFetchingNextPage,
      Object? error});
}

/// @nodoc
class _$PaginationStateCopyWithImpl<PageKey, ItemType, $Res,
        $Val extends PaginationState<PageKey, ItemType>>
    implements $PaginationStateCopyWith<PageKey, ItemType, $Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextPageKey = freezed,
    Object? isFetchingNextPage = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      nextPageKey: freezed == nextPageKey
          ? _value.nextPageKey
          : nextPageKey // ignore: cast_nullable_to_non_nullable
              as PageKey?,
      isFetchingNextPage: null == isFetchingNextPage
          ? _value.isFetchingNextPage
          : isFetchingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationStateImplCopyWith<PageKey, ItemType, $Res>
    implements $PaginationStateCopyWith<PageKey, ItemType, $Res> {
  factory _$$PaginationStateImplCopyWith(
          _$PaginationStateImpl<PageKey, ItemType> value,
          $Res Function(_$PaginationStateImpl<PageKey, ItemType>) then) =
      __$$PaginationStateImplCopyWithImpl<PageKey, ItemType, $Res>;
  @override
  @useResult
  $Res call(
      {List<ItemType> items,
      PageKey? nextPageKey,
      bool isFetchingNextPage,
      Object? error});
}

/// @nodoc
class __$$PaginationStateImplCopyWithImpl<PageKey, ItemType, $Res>
    extends _$PaginationStateCopyWithImpl<PageKey, ItemType, $Res,
        _$PaginationStateImpl<PageKey, ItemType>>
    implements _$$PaginationStateImplCopyWith<PageKey, ItemType, $Res> {
  __$$PaginationStateImplCopyWithImpl(
      _$PaginationStateImpl<PageKey, ItemType> _value,
      $Res Function(_$PaginationStateImpl<PageKey, ItemType>) _then)
      : super(_value, _then);

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextPageKey = freezed,
    Object? isFetchingNextPage = null,
    Object? error = freezed,
  }) {
    return _then(_$PaginationStateImpl<PageKey, ItemType>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      nextPageKey: freezed == nextPageKey
          ? _value.nextPageKey
          : nextPageKey // ignore: cast_nullable_to_non_nullable
              as PageKey?,
      isFetchingNextPage: null == isFetchingNextPage
          ? _value.isFetchingNextPage
          : isFetchingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$PaginationStateImpl<PageKey, ItemType>
    extends _PaginationState<PageKey, ItemType> {
  const _$PaginationStateImpl(
      {required final List<ItemType> items,
      required this.nextPageKey,
      required this.isFetchingNextPage,
      this.error})
      : _items = items,
        super._();

  final List<ItemType> _items;
  @override
  List<ItemType> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final PageKey? nextPageKey;
  @override
  final bool isFetchingNextPage;
  @override
  final Object? error;

  @override
  String toString() {
    return 'PaginationState<$PageKey, $ItemType>(items: $items, nextPageKey: $nextPageKey, isFetchingNextPage: $isFetchingNextPage, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationStateImpl<PageKey, ItemType> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other.nextPageKey, nextPageKey) &&
            (identical(other.isFetchingNextPage, isFetchingNextPage) ||
                other.isFetchingNextPage == isFetchingNextPage) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(nextPageKey),
      isFetchingNextPage,
      const DeepCollectionEquality().hash(error));

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationStateImplCopyWith<PageKey, ItemType,
          _$PaginationStateImpl<PageKey, ItemType>>
      get copyWith => __$$PaginationStateImplCopyWithImpl<PageKey, ItemType,
          _$PaginationStateImpl<PageKey, ItemType>>(this, _$identity);
}

abstract class _PaginationState<PageKey, ItemType>
    extends PaginationState<PageKey, ItemType> {
  const factory _PaginationState(
      {required final List<ItemType> items,
      required final PageKey? nextPageKey,
      required final bool isFetchingNextPage,
      final Object? error}) = _$PaginationStateImpl<PageKey, ItemType>;
  const _PaginationState._() : super._();

  @override
  List<ItemType> get items;
  @override
  PageKey? get nextPageKey;
  @override
  bool get isFetchingNextPage;
  @override
  Object? get error;

  /// Create a copy of PaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationStateImplCopyWith<PageKey, ItemType,
          _$PaginationStateImpl<PageKey, ItemType>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaginatedResult<PageKey, ItemType> {
  List<ItemType> get items => throw _privateConstructorUsedError;
  PageKey? get nextPageKey => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedResultCopyWith<PageKey, ItemType,
          PaginatedResult<PageKey, ItemType>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedResultCopyWith<PageKey, ItemType, $Res> {
  factory $PaginatedResultCopyWith(PaginatedResult<PageKey, ItemType> value,
          $Res Function(PaginatedResult<PageKey, ItemType>) then) =
      _$PaginatedResultCopyWithImpl<PageKey, ItemType, $Res,
          PaginatedResult<PageKey, ItemType>>;
  @useResult
  $Res call({List<ItemType> items, PageKey? nextPageKey});
}

/// @nodoc
class _$PaginatedResultCopyWithImpl<PageKey, ItemType, $Res,
        $Val extends PaginatedResult<PageKey, ItemType>>
    implements $PaginatedResultCopyWith<PageKey, ItemType, $Res> {
  _$PaginatedResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextPageKey = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      nextPageKey: freezed == nextPageKey
          ? _value.nextPageKey
          : nextPageKey // ignore: cast_nullable_to_non_nullable
              as PageKey?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedResultImplCopyWith<PageKey, ItemType, $Res>
    implements $PaginatedResultCopyWith<PageKey, ItemType, $Res> {
  factory _$$PaginatedResultImplCopyWith(
          _$PaginatedResultImpl<PageKey, ItemType> value,
          $Res Function(_$PaginatedResultImpl<PageKey, ItemType>) then) =
      __$$PaginatedResultImplCopyWithImpl<PageKey, ItemType, $Res>;
  @override
  @useResult
  $Res call({List<ItemType> items, PageKey? nextPageKey});
}

/// @nodoc
class __$$PaginatedResultImplCopyWithImpl<PageKey, ItemType, $Res>
    extends _$PaginatedResultCopyWithImpl<PageKey, ItemType, $Res,
        _$PaginatedResultImpl<PageKey, ItemType>>
    implements _$$PaginatedResultImplCopyWith<PageKey, ItemType, $Res> {
  __$$PaginatedResultImplCopyWithImpl(
      _$PaginatedResultImpl<PageKey, ItemType> _value,
      $Res Function(_$PaginatedResultImpl<PageKey, ItemType>) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextPageKey = freezed,
  }) {
    return _then(_$PaginatedResultImpl<PageKey, ItemType>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      nextPageKey: freezed == nextPageKey
          ? _value.nextPageKey
          : nextPageKey // ignore: cast_nullable_to_non_nullable
              as PageKey?,
    ));
  }
}

/// @nodoc

class _$PaginatedResultImpl<PageKey, ItemType>
    implements _PaginatedResult<PageKey, ItemType> {
  const _$PaginatedResultImpl(
      {required final List<ItemType> items, required this.nextPageKey})
      : _items = items;

  final List<ItemType> _items;
  @override
  List<ItemType> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final PageKey? nextPageKey;

  @override
  String toString() {
    return 'PaginatedResult<$PageKey, $ItemType>(items: $items, nextPageKey: $nextPageKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedResultImpl<PageKey, ItemType> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other.nextPageKey, nextPageKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(nextPageKey));

  /// Create a copy of PaginatedResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedResultImplCopyWith<PageKey, ItemType,
          _$PaginatedResultImpl<PageKey, ItemType>>
      get copyWith => __$$PaginatedResultImplCopyWithImpl<PageKey, ItemType,
          _$PaginatedResultImpl<PageKey, ItemType>>(this, _$identity);
}

abstract class _PaginatedResult<PageKey, ItemType>
    implements PaginatedResult<PageKey, ItemType> {
  const factory _PaginatedResult(
          {required final List<ItemType> items,
          required final PageKey? nextPageKey}) =
      _$PaginatedResultImpl<PageKey, ItemType>;

  @override
  List<ItemType> get items;
  @override
  PageKey? get nextPageKey;

  /// Create a copy of PaginatedResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedResultImplCopyWith<PageKey, ItemType,
          _$PaginatedResultImpl<PageKey, ItemType>>
      get copyWith => throw _privateConstructorUsedError;
}
