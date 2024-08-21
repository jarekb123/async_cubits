// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_db_api_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealsResult _$MealsResultFromJson(Map<String, dynamic> json) {
  return _MealsResult.fromJson(json);
}

/// @nodoc
mixin _$MealsResult {
  List<MealDTO> get meals => throw _privateConstructorUsedError;

  /// Serializes this MealsResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealsResultCopyWith<MealsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealsResultCopyWith<$Res> {
  factory $MealsResultCopyWith(
          MealsResult value, $Res Function(MealsResult) then) =
      _$MealsResultCopyWithImpl<$Res, MealsResult>;
  @useResult
  $Res call({List<MealDTO> meals});
}

/// @nodoc
class _$MealsResultCopyWithImpl<$Res, $Val extends MealsResult>
    implements $MealsResultCopyWith<$Res> {
  _$MealsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meals = null,
  }) {
    return _then(_value.copyWith(
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<MealDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealsResultImplCopyWith<$Res>
    implements $MealsResultCopyWith<$Res> {
  factory _$$MealsResultImplCopyWith(
          _$MealsResultImpl value, $Res Function(_$MealsResultImpl) then) =
      __$$MealsResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MealDTO> meals});
}

/// @nodoc
class __$$MealsResultImplCopyWithImpl<$Res>
    extends _$MealsResultCopyWithImpl<$Res, _$MealsResultImpl>
    implements _$$MealsResultImplCopyWith<$Res> {
  __$$MealsResultImplCopyWithImpl(
      _$MealsResultImpl _value, $Res Function(_$MealsResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meals = null,
  }) {
    return _then(_$MealsResultImpl(
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<MealDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealsResultImpl implements _MealsResult {
  const _$MealsResultImpl({required final List<MealDTO> meals})
      : _meals = meals;

  factory _$MealsResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealsResultImplFromJson(json);

  final List<MealDTO> _meals;
  @override
  List<MealDTO> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  String toString() {
    return 'MealsResult(meals: $meals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealsResultImpl &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  /// Create a copy of MealsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealsResultImplCopyWith<_$MealsResultImpl> get copyWith =>
      __$$MealsResultImplCopyWithImpl<_$MealsResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealsResultImplToJson(
      this,
    );
  }
}

abstract class _MealsResult implements MealsResult {
  const factory _MealsResult({required final List<MealDTO> meals}) =
      _$MealsResultImpl;

  factory _MealsResult.fromJson(Map<String, dynamic> json) =
      _$MealsResultImpl.fromJson;

  @override
  List<MealDTO> get meals;

  /// Create a copy of MealsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealsResultImplCopyWith<_$MealsResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealDTO _$MealDTOFromJson(Map<String, dynamic> json) {
  return _MealDTO.fromJson(json);
}

/// @nodoc
mixin _$MealDTO {
  String get idMeal => throw _privateConstructorUsedError;
  String get strMeal => throw _privateConstructorUsedError;
  String? get strDrinkAlternate => throw _privateConstructorUsedError;
  String? get strCategory => throw _privateConstructorUsedError;
  String? get strArea => throw _privateConstructorUsedError;
  String? get strInstructions => throw _privateConstructorUsedError;
  String? get strMealThumb => throw _privateConstructorUsedError;
  String? get strTags => throw _privateConstructorUsedError;
  String? get strYoutube => throw _privateConstructorUsedError;
  String? get strIngredient1 => throw _privateConstructorUsedError;
  String? get strIngredient2 => throw _privateConstructorUsedError;
  String? get strIngredient3 => throw _privateConstructorUsedError;
  String? get strIngredient4 => throw _privateConstructorUsedError;
  String? get strIngredient5 => throw _privateConstructorUsedError;
  String? get strIngredient6 => throw _privateConstructorUsedError;
  String? get strIngredient7 => throw _privateConstructorUsedError;
  String? get strIngredient8 => throw _privateConstructorUsedError;
  String? get strIngredient9 => throw _privateConstructorUsedError;
  String? get strIngredient10 => throw _privateConstructorUsedError;
  String? get strIngredient11 => throw _privateConstructorUsedError;
  String? get strIngredient12 => throw _privateConstructorUsedError;
  String? get strIngredient13 => throw _privateConstructorUsedError;
  String? get strIngredient14 => throw _privateConstructorUsedError;
  String? get strIngredient15 => throw _privateConstructorUsedError;
  String? get strIngredient16 => throw _privateConstructorUsedError;
  String? get strIngredient17 => throw _privateConstructorUsedError;
  String? get strIngredient18 => throw _privateConstructorUsedError;
  String? get strIngredient19 => throw _privateConstructorUsedError;
  String? get strIngredient20 => throw _privateConstructorUsedError;
  String? get strMeasure1 => throw _privateConstructorUsedError;
  String? get strMeasure2 => throw _privateConstructorUsedError;
  String? get strMeasure3 => throw _privateConstructorUsedError;
  String? get strMeasure4 => throw _privateConstructorUsedError;
  String? get strMeasure5 => throw _privateConstructorUsedError;
  String? get strMeasure6 => throw _privateConstructorUsedError;
  String? get strMeasure7 => throw _privateConstructorUsedError;
  String? get strMeasure8 => throw _privateConstructorUsedError;
  String? get strMeasure9 => throw _privateConstructorUsedError;
  String? get strMeasure10 => throw _privateConstructorUsedError;
  String? get strMeasure11 => throw _privateConstructorUsedError;
  String? get strMeasure12 => throw _privateConstructorUsedError;
  String? get strMeasure13 => throw _privateConstructorUsedError;
  String? get strMeasure14 => throw _privateConstructorUsedError;
  String? get strMeasure15 => throw _privateConstructorUsedError;
  String? get strMeasure16 => throw _privateConstructorUsedError;
  String? get strMeasure17 => throw _privateConstructorUsedError;
  String? get strMeasure18 => throw _privateConstructorUsedError;
  String? get strMeasure19 => throw _privateConstructorUsedError;
  String? get strMeasure20 => throw _privateConstructorUsedError;

  /// Serializes this MealDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealDTOCopyWith<MealDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealDTOCopyWith<$Res> {
  factory $MealDTOCopyWith(MealDTO value, $Res Function(MealDTO) then) =
      _$MealDTOCopyWithImpl<$Res, MealDTO>;
  @useResult
  $Res call(
      {String idMeal,
      String strMeal,
      String? strDrinkAlternate,
      String? strCategory,
      String? strArea,
      String? strInstructions,
      String? strMealThumb,
      String? strTags,
      String? strYoutube,
      String? strIngredient1,
      String? strIngredient2,
      String? strIngredient3,
      String? strIngredient4,
      String? strIngredient5,
      String? strIngredient6,
      String? strIngredient7,
      String? strIngredient8,
      String? strIngredient9,
      String? strIngredient10,
      String? strIngredient11,
      String? strIngredient12,
      String? strIngredient13,
      String? strIngredient14,
      String? strIngredient15,
      String? strIngredient16,
      String? strIngredient17,
      String? strIngredient18,
      String? strIngredient19,
      String? strIngredient20,
      String? strMeasure1,
      String? strMeasure2,
      String? strMeasure3,
      String? strMeasure4,
      String? strMeasure5,
      String? strMeasure6,
      String? strMeasure7,
      String? strMeasure8,
      String? strMeasure9,
      String? strMeasure10,
      String? strMeasure11,
      String? strMeasure12,
      String? strMeasure13,
      String? strMeasure14,
      String? strMeasure15,
      String? strMeasure16,
      String? strMeasure17,
      String? strMeasure18,
      String? strMeasure19,
      String? strMeasure20});
}

/// @nodoc
class _$MealDTOCopyWithImpl<$Res, $Val extends MealDTO>
    implements $MealDTOCopyWith<$Res> {
  _$MealDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMeal = null,
    Object? strMeal = null,
    Object? strDrinkAlternate = freezed,
    Object? strCategory = freezed,
    Object? strArea = freezed,
    Object? strInstructions = freezed,
    Object? strMealThumb = freezed,
    Object? strTags = freezed,
    Object? strYoutube = freezed,
    Object? strIngredient1 = freezed,
    Object? strIngredient2 = freezed,
    Object? strIngredient3 = freezed,
    Object? strIngredient4 = freezed,
    Object? strIngredient5 = freezed,
    Object? strIngredient6 = freezed,
    Object? strIngredient7 = freezed,
    Object? strIngredient8 = freezed,
    Object? strIngredient9 = freezed,
    Object? strIngredient10 = freezed,
    Object? strIngredient11 = freezed,
    Object? strIngredient12 = freezed,
    Object? strIngredient13 = freezed,
    Object? strIngredient14 = freezed,
    Object? strIngredient15 = freezed,
    Object? strIngredient16 = freezed,
    Object? strIngredient17 = freezed,
    Object? strIngredient18 = freezed,
    Object? strIngredient19 = freezed,
    Object? strIngredient20 = freezed,
    Object? strMeasure1 = freezed,
    Object? strMeasure2 = freezed,
    Object? strMeasure3 = freezed,
    Object? strMeasure4 = freezed,
    Object? strMeasure5 = freezed,
    Object? strMeasure6 = freezed,
    Object? strMeasure7 = freezed,
    Object? strMeasure8 = freezed,
    Object? strMeasure9 = freezed,
    Object? strMeasure10 = freezed,
    Object? strMeasure11 = freezed,
    Object? strMeasure12 = freezed,
    Object? strMeasure13 = freezed,
    Object? strMeasure14 = freezed,
    Object? strMeasure15 = freezed,
    Object? strMeasure16 = freezed,
    Object? strMeasure17 = freezed,
    Object? strMeasure18 = freezed,
    Object? strMeasure19 = freezed,
    Object? strMeasure20 = freezed,
  }) {
    return _then(_value.copyWith(
      idMeal: null == idMeal
          ? _value.idMeal
          : idMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strMeal: null == strMeal
          ? _value.strMeal
          : strMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strDrinkAlternate: freezed == strDrinkAlternate
          ? _value.strDrinkAlternate
          : strDrinkAlternate // ignore: cast_nullable_to_non_nullable
              as String?,
      strCategory: freezed == strCategory
          ? _value.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      strArea: freezed == strArea
          ? _value.strArea
          : strArea // ignore: cast_nullable_to_non_nullable
              as String?,
      strInstructions: freezed == strInstructions
          ? _value.strInstructions
          : strInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      strMealThumb: freezed == strMealThumb
          ? _value.strMealThumb
          : strMealThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      strTags: freezed == strTags
          ? _value.strTags
          : strTags // ignore: cast_nullable_to_non_nullable
              as String?,
      strYoutube: freezed == strYoutube
          ? _value.strYoutube
          : strYoutube // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient1: freezed == strIngredient1
          ? _value.strIngredient1
          : strIngredient1 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient2: freezed == strIngredient2
          ? _value.strIngredient2
          : strIngredient2 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient3: freezed == strIngredient3
          ? _value.strIngredient3
          : strIngredient3 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient4: freezed == strIngredient4
          ? _value.strIngredient4
          : strIngredient4 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient5: freezed == strIngredient5
          ? _value.strIngredient5
          : strIngredient5 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient6: freezed == strIngredient6
          ? _value.strIngredient6
          : strIngredient6 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient7: freezed == strIngredient7
          ? _value.strIngredient7
          : strIngredient7 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient8: freezed == strIngredient8
          ? _value.strIngredient8
          : strIngredient8 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient9: freezed == strIngredient9
          ? _value.strIngredient9
          : strIngredient9 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient10: freezed == strIngredient10
          ? _value.strIngredient10
          : strIngredient10 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient11: freezed == strIngredient11
          ? _value.strIngredient11
          : strIngredient11 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient12: freezed == strIngredient12
          ? _value.strIngredient12
          : strIngredient12 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient13: freezed == strIngredient13
          ? _value.strIngredient13
          : strIngredient13 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient14: freezed == strIngredient14
          ? _value.strIngredient14
          : strIngredient14 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient15: freezed == strIngredient15
          ? _value.strIngredient15
          : strIngredient15 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient16: freezed == strIngredient16
          ? _value.strIngredient16
          : strIngredient16 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient17: freezed == strIngredient17
          ? _value.strIngredient17
          : strIngredient17 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient18: freezed == strIngredient18
          ? _value.strIngredient18
          : strIngredient18 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient19: freezed == strIngredient19
          ? _value.strIngredient19
          : strIngredient19 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient20: freezed == strIngredient20
          ? _value.strIngredient20
          : strIngredient20 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure1: freezed == strMeasure1
          ? _value.strMeasure1
          : strMeasure1 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure2: freezed == strMeasure2
          ? _value.strMeasure2
          : strMeasure2 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure3: freezed == strMeasure3
          ? _value.strMeasure3
          : strMeasure3 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure4: freezed == strMeasure4
          ? _value.strMeasure4
          : strMeasure4 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure5: freezed == strMeasure5
          ? _value.strMeasure5
          : strMeasure5 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure6: freezed == strMeasure6
          ? _value.strMeasure6
          : strMeasure6 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure7: freezed == strMeasure7
          ? _value.strMeasure7
          : strMeasure7 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure8: freezed == strMeasure8
          ? _value.strMeasure8
          : strMeasure8 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure9: freezed == strMeasure9
          ? _value.strMeasure9
          : strMeasure9 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure10: freezed == strMeasure10
          ? _value.strMeasure10
          : strMeasure10 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure11: freezed == strMeasure11
          ? _value.strMeasure11
          : strMeasure11 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure12: freezed == strMeasure12
          ? _value.strMeasure12
          : strMeasure12 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure13: freezed == strMeasure13
          ? _value.strMeasure13
          : strMeasure13 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure14: freezed == strMeasure14
          ? _value.strMeasure14
          : strMeasure14 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure15: freezed == strMeasure15
          ? _value.strMeasure15
          : strMeasure15 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure16: freezed == strMeasure16
          ? _value.strMeasure16
          : strMeasure16 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure17: freezed == strMeasure17
          ? _value.strMeasure17
          : strMeasure17 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure18: freezed == strMeasure18
          ? _value.strMeasure18
          : strMeasure18 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure19: freezed == strMeasure19
          ? _value.strMeasure19
          : strMeasure19 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure20: freezed == strMeasure20
          ? _value.strMeasure20
          : strMeasure20 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealDTOImplCopyWith<$Res> implements $MealDTOCopyWith<$Res> {
  factory _$$MealDTOImplCopyWith(
          _$MealDTOImpl value, $Res Function(_$MealDTOImpl) then) =
      __$$MealDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idMeal,
      String strMeal,
      String? strDrinkAlternate,
      String? strCategory,
      String? strArea,
      String? strInstructions,
      String? strMealThumb,
      String? strTags,
      String? strYoutube,
      String? strIngredient1,
      String? strIngredient2,
      String? strIngredient3,
      String? strIngredient4,
      String? strIngredient5,
      String? strIngredient6,
      String? strIngredient7,
      String? strIngredient8,
      String? strIngredient9,
      String? strIngredient10,
      String? strIngredient11,
      String? strIngredient12,
      String? strIngredient13,
      String? strIngredient14,
      String? strIngredient15,
      String? strIngredient16,
      String? strIngredient17,
      String? strIngredient18,
      String? strIngredient19,
      String? strIngredient20,
      String? strMeasure1,
      String? strMeasure2,
      String? strMeasure3,
      String? strMeasure4,
      String? strMeasure5,
      String? strMeasure6,
      String? strMeasure7,
      String? strMeasure8,
      String? strMeasure9,
      String? strMeasure10,
      String? strMeasure11,
      String? strMeasure12,
      String? strMeasure13,
      String? strMeasure14,
      String? strMeasure15,
      String? strMeasure16,
      String? strMeasure17,
      String? strMeasure18,
      String? strMeasure19,
      String? strMeasure20});
}

/// @nodoc
class __$$MealDTOImplCopyWithImpl<$Res>
    extends _$MealDTOCopyWithImpl<$Res, _$MealDTOImpl>
    implements _$$MealDTOImplCopyWith<$Res> {
  __$$MealDTOImplCopyWithImpl(
      _$MealDTOImpl _value, $Res Function(_$MealDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMeal = null,
    Object? strMeal = null,
    Object? strDrinkAlternate = freezed,
    Object? strCategory = freezed,
    Object? strArea = freezed,
    Object? strInstructions = freezed,
    Object? strMealThumb = freezed,
    Object? strTags = freezed,
    Object? strYoutube = freezed,
    Object? strIngredient1 = freezed,
    Object? strIngredient2 = freezed,
    Object? strIngredient3 = freezed,
    Object? strIngredient4 = freezed,
    Object? strIngredient5 = freezed,
    Object? strIngredient6 = freezed,
    Object? strIngredient7 = freezed,
    Object? strIngredient8 = freezed,
    Object? strIngredient9 = freezed,
    Object? strIngredient10 = freezed,
    Object? strIngredient11 = freezed,
    Object? strIngredient12 = freezed,
    Object? strIngredient13 = freezed,
    Object? strIngredient14 = freezed,
    Object? strIngredient15 = freezed,
    Object? strIngredient16 = freezed,
    Object? strIngredient17 = freezed,
    Object? strIngredient18 = freezed,
    Object? strIngredient19 = freezed,
    Object? strIngredient20 = freezed,
    Object? strMeasure1 = freezed,
    Object? strMeasure2 = freezed,
    Object? strMeasure3 = freezed,
    Object? strMeasure4 = freezed,
    Object? strMeasure5 = freezed,
    Object? strMeasure6 = freezed,
    Object? strMeasure7 = freezed,
    Object? strMeasure8 = freezed,
    Object? strMeasure9 = freezed,
    Object? strMeasure10 = freezed,
    Object? strMeasure11 = freezed,
    Object? strMeasure12 = freezed,
    Object? strMeasure13 = freezed,
    Object? strMeasure14 = freezed,
    Object? strMeasure15 = freezed,
    Object? strMeasure16 = freezed,
    Object? strMeasure17 = freezed,
    Object? strMeasure18 = freezed,
    Object? strMeasure19 = freezed,
    Object? strMeasure20 = freezed,
  }) {
    return _then(_$MealDTOImpl(
      idMeal: null == idMeal
          ? _value.idMeal
          : idMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strMeal: null == strMeal
          ? _value.strMeal
          : strMeal // ignore: cast_nullable_to_non_nullable
              as String,
      strDrinkAlternate: freezed == strDrinkAlternate
          ? _value.strDrinkAlternate
          : strDrinkAlternate // ignore: cast_nullable_to_non_nullable
              as String?,
      strCategory: freezed == strCategory
          ? _value.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      strArea: freezed == strArea
          ? _value.strArea
          : strArea // ignore: cast_nullable_to_non_nullable
              as String?,
      strInstructions: freezed == strInstructions
          ? _value.strInstructions
          : strInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      strMealThumb: freezed == strMealThumb
          ? _value.strMealThumb
          : strMealThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      strTags: freezed == strTags
          ? _value.strTags
          : strTags // ignore: cast_nullable_to_non_nullable
              as String?,
      strYoutube: freezed == strYoutube
          ? _value.strYoutube
          : strYoutube // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient1: freezed == strIngredient1
          ? _value.strIngredient1
          : strIngredient1 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient2: freezed == strIngredient2
          ? _value.strIngredient2
          : strIngredient2 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient3: freezed == strIngredient3
          ? _value.strIngredient3
          : strIngredient3 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient4: freezed == strIngredient4
          ? _value.strIngredient4
          : strIngredient4 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient5: freezed == strIngredient5
          ? _value.strIngredient5
          : strIngredient5 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient6: freezed == strIngredient6
          ? _value.strIngredient6
          : strIngredient6 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient7: freezed == strIngredient7
          ? _value.strIngredient7
          : strIngredient7 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient8: freezed == strIngredient8
          ? _value.strIngredient8
          : strIngredient8 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient9: freezed == strIngredient9
          ? _value.strIngredient9
          : strIngredient9 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient10: freezed == strIngredient10
          ? _value.strIngredient10
          : strIngredient10 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient11: freezed == strIngredient11
          ? _value.strIngredient11
          : strIngredient11 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient12: freezed == strIngredient12
          ? _value.strIngredient12
          : strIngredient12 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient13: freezed == strIngredient13
          ? _value.strIngredient13
          : strIngredient13 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient14: freezed == strIngredient14
          ? _value.strIngredient14
          : strIngredient14 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient15: freezed == strIngredient15
          ? _value.strIngredient15
          : strIngredient15 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient16: freezed == strIngredient16
          ? _value.strIngredient16
          : strIngredient16 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient17: freezed == strIngredient17
          ? _value.strIngredient17
          : strIngredient17 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient18: freezed == strIngredient18
          ? _value.strIngredient18
          : strIngredient18 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient19: freezed == strIngredient19
          ? _value.strIngredient19
          : strIngredient19 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient20: freezed == strIngredient20
          ? _value.strIngredient20
          : strIngredient20 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure1: freezed == strMeasure1
          ? _value.strMeasure1
          : strMeasure1 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure2: freezed == strMeasure2
          ? _value.strMeasure2
          : strMeasure2 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure3: freezed == strMeasure3
          ? _value.strMeasure3
          : strMeasure3 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure4: freezed == strMeasure4
          ? _value.strMeasure4
          : strMeasure4 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure5: freezed == strMeasure5
          ? _value.strMeasure5
          : strMeasure5 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure6: freezed == strMeasure6
          ? _value.strMeasure6
          : strMeasure6 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure7: freezed == strMeasure7
          ? _value.strMeasure7
          : strMeasure7 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure8: freezed == strMeasure8
          ? _value.strMeasure8
          : strMeasure8 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure9: freezed == strMeasure9
          ? _value.strMeasure9
          : strMeasure9 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure10: freezed == strMeasure10
          ? _value.strMeasure10
          : strMeasure10 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure11: freezed == strMeasure11
          ? _value.strMeasure11
          : strMeasure11 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure12: freezed == strMeasure12
          ? _value.strMeasure12
          : strMeasure12 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure13: freezed == strMeasure13
          ? _value.strMeasure13
          : strMeasure13 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure14: freezed == strMeasure14
          ? _value.strMeasure14
          : strMeasure14 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure15: freezed == strMeasure15
          ? _value.strMeasure15
          : strMeasure15 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure16: freezed == strMeasure16
          ? _value.strMeasure16
          : strMeasure16 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure17: freezed == strMeasure17
          ? _value.strMeasure17
          : strMeasure17 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure18: freezed == strMeasure18
          ? _value.strMeasure18
          : strMeasure18 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure19: freezed == strMeasure19
          ? _value.strMeasure19
          : strMeasure19 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure20: freezed == strMeasure20
          ? _value.strMeasure20
          : strMeasure20 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealDTOImpl implements _MealDTO {
  const _$MealDTOImpl(
      {required this.idMeal,
      required this.strMeal,
      this.strDrinkAlternate,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.strTags,
      this.strYoutube,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strIngredient16,
      this.strIngredient17,
      this.strIngredient18,
      this.strIngredient19,
      this.strIngredient20,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strMeasure16,
      this.strMeasure17,
      this.strMeasure18,
      this.strMeasure19,
      this.strMeasure20});

  factory _$MealDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealDTOImplFromJson(json);

  @override
  final String idMeal;
  @override
  final String strMeal;
  @override
  final String? strDrinkAlternate;
  @override
  final String? strCategory;
  @override
  final String? strArea;
  @override
  final String? strInstructions;
  @override
  final String? strMealThumb;
  @override
  final String? strTags;
  @override
  final String? strYoutube;
  @override
  final String? strIngredient1;
  @override
  final String? strIngredient2;
  @override
  final String? strIngredient3;
  @override
  final String? strIngredient4;
  @override
  final String? strIngredient5;
  @override
  final String? strIngredient6;
  @override
  final String? strIngredient7;
  @override
  final String? strIngredient8;
  @override
  final String? strIngredient9;
  @override
  final String? strIngredient10;
  @override
  final String? strIngredient11;
  @override
  final String? strIngredient12;
  @override
  final String? strIngredient13;
  @override
  final String? strIngredient14;
  @override
  final String? strIngredient15;
  @override
  final String? strIngredient16;
  @override
  final String? strIngredient17;
  @override
  final String? strIngredient18;
  @override
  final String? strIngredient19;
  @override
  final String? strIngredient20;
  @override
  final String? strMeasure1;
  @override
  final String? strMeasure2;
  @override
  final String? strMeasure3;
  @override
  final String? strMeasure4;
  @override
  final String? strMeasure5;
  @override
  final String? strMeasure6;
  @override
  final String? strMeasure7;
  @override
  final String? strMeasure8;
  @override
  final String? strMeasure9;
  @override
  final String? strMeasure10;
  @override
  final String? strMeasure11;
  @override
  final String? strMeasure12;
  @override
  final String? strMeasure13;
  @override
  final String? strMeasure14;
  @override
  final String? strMeasure15;
  @override
  final String? strMeasure16;
  @override
  final String? strMeasure17;
  @override
  final String? strMeasure18;
  @override
  final String? strMeasure19;
  @override
  final String? strMeasure20;

  @override
  String toString() {
    return 'MealDTO(idMeal: $idMeal, strMeal: $strMeal, strDrinkAlternate: $strDrinkAlternate, strCategory: $strCategory, strArea: $strArea, strInstructions: $strInstructions, strMealThumb: $strMealThumb, strTags: $strTags, strYoutube: $strYoutube, strIngredient1: $strIngredient1, strIngredient2: $strIngredient2, strIngredient3: $strIngredient3, strIngredient4: $strIngredient4, strIngredient5: $strIngredient5, strIngredient6: $strIngredient6, strIngredient7: $strIngredient7, strIngredient8: $strIngredient8, strIngredient9: $strIngredient9, strIngredient10: $strIngredient10, strIngredient11: $strIngredient11, strIngredient12: $strIngredient12, strIngredient13: $strIngredient13, strIngredient14: $strIngredient14, strIngredient15: $strIngredient15, strIngredient16: $strIngredient16, strIngredient17: $strIngredient17, strIngredient18: $strIngredient18, strIngredient19: $strIngredient19, strIngredient20: $strIngredient20, strMeasure1: $strMeasure1, strMeasure2: $strMeasure2, strMeasure3: $strMeasure3, strMeasure4: $strMeasure4, strMeasure5: $strMeasure5, strMeasure6: $strMeasure6, strMeasure7: $strMeasure7, strMeasure8: $strMeasure8, strMeasure9: $strMeasure9, strMeasure10: $strMeasure10, strMeasure11: $strMeasure11, strMeasure12: $strMeasure12, strMeasure13: $strMeasure13, strMeasure14: $strMeasure14, strMeasure15: $strMeasure15, strMeasure16: $strMeasure16, strMeasure17: $strMeasure17, strMeasure18: $strMeasure18, strMeasure19: $strMeasure19, strMeasure20: $strMeasure20)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealDTOImpl &&
            (identical(other.idMeal, idMeal) || other.idMeal == idMeal) &&
            (identical(other.strMeal, strMeal) || other.strMeal == strMeal) &&
            (identical(other.strDrinkAlternate, strDrinkAlternate) ||
                other.strDrinkAlternate == strDrinkAlternate) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strArea, strArea) || other.strArea == strArea) &&
            (identical(other.strInstructions, strInstructions) ||
                other.strInstructions == strInstructions) &&
            (identical(other.strMealThumb, strMealThumb) ||
                other.strMealThumb == strMealThumb) &&
            (identical(other.strTags, strTags) || other.strTags == strTags) &&
            (identical(other.strYoutube, strYoutube) ||
                other.strYoutube == strYoutube) &&
            (identical(other.strIngredient1, strIngredient1) ||
                other.strIngredient1 == strIngredient1) &&
            (identical(other.strIngredient2, strIngredient2) ||
                other.strIngredient2 == strIngredient2) &&
            (identical(other.strIngredient3, strIngredient3) ||
                other.strIngredient3 == strIngredient3) &&
            (identical(other.strIngredient4, strIngredient4) ||
                other.strIngredient4 == strIngredient4) &&
            (identical(other.strIngredient5, strIngredient5) ||
                other.strIngredient5 == strIngredient5) &&
            (identical(other.strIngredient6, strIngredient6) ||
                other.strIngredient6 == strIngredient6) &&
            (identical(other.strIngredient7, strIngredient7) ||
                other.strIngredient7 == strIngredient7) &&
            (identical(other.strIngredient8, strIngredient8) ||
                other.strIngredient8 == strIngredient8) &&
            (identical(other.strIngredient9, strIngredient9) ||
                other.strIngredient9 == strIngredient9) &&
            (identical(other.strIngredient10, strIngredient10) ||
                other.strIngredient10 == strIngredient10) &&
            (identical(other.strIngredient11, strIngredient11) ||
                other.strIngredient11 == strIngredient11) &&
            (identical(other.strIngredient12, strIngredient12) ||
                other.strIngredient12 == strIngredient12) &&
            (identical(other.strIngredient13, strIngredient13) ||
                other.strIngredient13 == strIngredient13) &&
            (identical(other.strIngredient14, strIngredient14) ||
                other.strIngredient14 == strIngredient14) &&
            (identical(other.strIngredient15, strIngredient15) ||
                other.strIngredient15 == strIngredient15) &&
            (identical(other.strIngredient16, strIngredient16) ||
                other.strIngredient16 == strIngredient16) &&
            (identical(other.strIngredient17, strIngredient17) ||
                other.strIngredient17 == strIngredient17) &&
            (identical(other.strIngredient18, strIngredient18) ||
                other.strIngredient18 == strIngredient18) &&
            (identical(other.strIngredient19, strIngredient19) ||
                other.strIngredient19 == strIngredient19) &&
            (identical(other.strIngredient20, strIngredient20) ||
                other.strIngredient20 == strIngredient20) &&
            (identical(other.strMeasure1, strMeasure1) ||
                other.strMeasure1 == strMeasure1) &&
            (identical(other.strMeasure2, strMeasure2) ||
                other.strMeasure2 == strMeasure2) &&
            (identical(other.strMeasure3, strMeasure3) ||
                other.strMeasure3 == strMeasure3) &&
            (identical(other.strMeasure4, strMeasure4) ||
                other.strMeasure4 == strMeasure4) &&
            (identical(other.strMeasure5, strMeasure5) ||
                other.strMeasure5 == strMeasure5) &&
            (identical(other.strMeasure6, strMeasure6) ||
                other.strMeasure6 == strMeasure6) &&
            (identical(other.strMeasure7, strMeasure7) ||
                other.strMeasure7 == strMeasure7) &&
            (identical(other.strMeasure8, strMeasure8) ||
                other.strMeasure8 == strMeasure8) &&
            (identical(other.strMeasure9, strMeasure9) ||
                other.strMeasure9 == strMeasure9) &&
            (identical(other.strMeasure10, strMeasure10) ||
                other.strMeasure10 == strMeasure10) &&
            (identical(other.strMeasure11, strMeasure11) ||
                other.strMeasure11 == strMeasure11) &&
            (identical(other.strMeasure12, strMeasure12) ||
                other.strMeasure12 == strMeasure12) &&
            (identical(other.strMeasure13, strMeasure13) ||
                other.strMeasure13 == strMeasure13) &&
            (identical(other.strMeasure14, strMeasure14) ||
                other.strMeasure14 == strMeasure14) &&
            (identical(other.strMeasure15, strMeasure15) ||
                other.strMeasure15 == strMeasure15) &&
            (identical(other.strMeasure16, strMeasure16) ||
                other.strMeasure16 == strMeasure16) &&
            (identical(other.strMeasure17, strMeasure17) ||
                other.strMeasure17 == strMeasure17) &&
            (identical(other.strMeasure18, strMeasure18) ||
                other.strMeasure18 == strMeasure18) &&
            (identical(other.strMeasure19, strMeasure19) || other.strMeasure19 == strMeasure19) &&
            (identical(other.strMeasure20, strMeasure20) || other.strMeasure20 == strMeasure20));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idMeal,
        strMeal,
        strDrinkAlternate,
        strCategory,
        strArea,
        strInstructions,
        strMealThumb,
        strTags,
        strYoutube,
        strIngredient1,
        strIngredient2,
        strIngredient3,
        strIngredient4,
        strIngredient5,
        strIngredient6,
        strIngredient7,
        strIngredient8,
        strIngredient9,
        strIngredient10,
        strIngredient11,
        strIngredient12,
        strIngredient13,
        strIngredient14,
        strIngredient15,
        strIngredient16,
        strIngredient17,
        strIngredient18,
        strIngredient19,
        strIngredient20,
        strMeasure1,
        strMeasure2,
        strMeasure3,
        strMeasure4,
        strMeasure5,
        strMeasure6,
        strMeasure7,
        strMeasure8,
        strMeasure9,
        strMeasure10,
        strMeasure11,
        strMeasure12,
        strMeasure13,
        strMeasure14,
        strMeasure15,
        strMeasure16,
        strMeasure17,
        strMeasure18,
        strMeasure19,
        strMeasure20
      ]);

  /// Create a copy of MealDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealDTOImplCopyWith<_$MealDTOImpl> get copyWith =>
      __$$MealDTOImplCopyWithImpl<_$MealDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealDTOImplToJson(
      this,
    );
  }
}

abstract class _MealDTO implements MealDTO {
  const factory _MealDTO(
      {required final String idMeal,
      required final String strMeal,
      final String? strDrinkAlternate,
      final String? strCategory,
      final String? strArea,
      final String? strInstructions,
      final String? strMealThumb,
      final String? strTags,
      final String? strYoutube,
      final String? strIngredient1,
      final String? strIngredient2,
      final String? strIngredient3,
      final String? strIngredient4,
      final String? strIngredient5,
      final String? strIngredient6,
      final String? strIngredient7,
      final String? strIngredient8,
      final String? strIngredient9,
      final String? strIngredient10,
      final String? strIngredient11,
      final String? strIngredient12,
      final String? strIngredient13,
      final String? strIngredient14,
      final String? strIngredient15,
      final String? strIngredient16,
      final String? strIngredient17,
      final String? strIngredient18,
      final String? strIngredient19,
      final String? strIngredient20,
      final String? strMeasure1,
      final String? strMeasure2,
      final String? strMeasure3,
      final String? strMeasure4,
      final String? strMeasure5,
      final String? strMeasure6,
      final String? strMeasure7,
      final String? strMeasure8,
      final String? strMeasure9,
      final String? strMeasure10,
      final String? strMeasure11,
      final String? strMeasure12,
      final String? strMeasure13,
      final String? strMeasure14,
      final String? strMeasure15,
      final String? strMeasure16,
      final String? strMeasure17,
      final String? strMeasure18,
      final String? strMeasure19,
      final String? strMeasure20}) = _$MealDTOImpl;

  factory _MealDTO.fromJson(Map<String, dynamic> json) = _$MealDTOImpl.fromJson;

  @override
  String get idMeal;
  @override
  String get strMeal;
  @override
  String? get strDrinkAlternate;
  @override
  String? get strCategory;
  @override
  String? get strArea;
  @override
  String? get strInstructions;
  @override
  String? get strMealThumb;
  @override
  String? get strTags;
  @override
  String? get strYoutube;
  @override
  String? get strIngredient1;
  @override
  String? get strIngredient2;
  @override
  String? get strIngredient3;
  @override
  String? get strIngredient4;
  @override
  String? get strIngredient5;
  @override
  String? get strIngredient6;
  @override
  String? get strIngredient7;
  @override
  String? get strIngredient8;
  @override
  String? get strIngredient9;
  @override
  String? get strIngredient10;
  @override
  String? get strIngredient11;
  @override
  String? get strIngredient12;
  @override
  String? get strIngredient13;
  @override
  String? get strIngredient14;
  @override
  String? get strIngredient15;
  @override
  String? get strIngredient16;
  @override
  String? get strIngredient17;
  @override
  String? get strIngredient18;
  @override
  String? get strIngredient19;
  @override
  String? get strIngredient20;
  @override
  String? get strMeasure1;
  @override
  String? get strMeasure2;
  @override
  String? get strMeasure3;
  @override
  String? get strMeasure4;
  @override
  String? get strMeasure5;
  @override
  String? get strMeasure6;
  @override
  String? get strMeasure7;
  @override
  String? get strMeasure8;
  @override
  String? get strMeasure9;
  @override
  String? get strMeasure10;
  @override
  String? get strMeasure11;
  @override
  String? get strMeasure12;
  @override
  String? get strMeasure13;
  @override
  String? get strMeasure14;
  @override
  String? get strMeasure15;
  @override
  String? get strMeasure16;
  @override
  String? get strMeasure17;
  @override
  String? get strMeasure18;
  @override
  String? get strMeasure19;
  @override
  String? get strMeasure20;

  /// Create a copy of MealDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealDTOImplCopyWith<_$MealDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
