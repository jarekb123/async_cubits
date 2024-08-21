// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_brewery_db_api_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BreweryDTO _$BreweryDTOFromJson(Map<String, dynamic> json) {
  return _BreweryDTO.fromJson(json);
}

/// @nodoc
mixin _$BreweryDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get address_1 => throw _privateConstructorUsedError;
  String? get address_2 => throw _privateConstructorUsedError;
  String? get address_3 => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;

  /// Serializes this BreweryDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreweryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreweryDTOCopyWith<BreweryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreweryDTOCopyWith<$Res> {
  factory $BreweryDTOCopyWith(
          BreweryDTO value, $Res Function(BreweryDTO) then) =
      _$BreweryDTOCopyWithImpl<$Res, BreweryDTO>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? address_1,
      String? address_2,
      String? address_3,
      String city,
      String country,
      String? longitude,
      String? latitude,
      String? phone,
      String? state,
      String? street});
}

/// @nodoc
class _$BreweryDTOCopyWithImpl<$Res, $Val extends BreweryDTO>
    implements $BreweryDTOCopyWith<$Res> {
  _$BreweryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreweryDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address_1 = freezed,
    Object? address_2 = freezed,
    Object? address_3 = freezed,
    Object? city = null,
    Object? country = null,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? phone = freezed,
    Object? state = freezed,
    Object? street = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address_1: freezed == address_1
          ? _value.address_1
          : address_1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address_2: freezed == address_2
          ? _value.address_2
          : address_2 // ignore: cast_nullable_to_non_nullable
              as String?,
      address_3: freezed == address_3
          ? _value.address_3
          : address_3 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreweryDTOImplCopyWith<$Res>
    implements $BreweryDTOCopyWith<$Res> {
  factory _$$BreweryDTOImplCopyWith(
          _$BreweryDTOImpl value, $Res Function(_$BreweryDTOImpl) then) =
      __$$BreweryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? address_1,
      String? address_2,
      String? address_3,
      String city,
      String country,
      String? longitude,
      String? latitude,
      String? phone,
      String? state,
      String? street});
}

/// @nodoc
class __$$BreweryDTOImplCopyWithImpl<$Res>
    extends _$BreweryDTOCopyWithImpl<$Res, _$BreweryDTOImpl>
    implements _$$BreweryDTOImplCopyWith<$Res> {
  __$$BreweryDTOImplCopyWithImpl(
      _$BreweryDTOImpl _value, $Res Function(_$BreweryDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of BreweryDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address_1 = freezed,
    Object? address_2 = freezed,
    Object? address_3 = freezed,
    Object? city = null,
    Object? country = null,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? phone = freezed,
    Object? state = freezed,
    Object? street = freezed,
  }) {
    return _then(_$BreweryDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address_1: freezed == address_1
          ? _value.address_1
          : address_1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address_2: freezed == address_2
          ? _value.address_2
          : address_2 // ignore: cast_nullable_to_non_nullable
              as String?,
      address_3: freezed == address_3
          ? _value.address_3
          : address_3 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BreweryDTOImpl implements _BreweryDTO {
  const _$BreweryDTOImpl(
      {required this.id,
      required this.name,
      this.address_1,
      this.address_2,
      this.address_3,
      required this.city,
      required this.country,
      this.longitude,
      this.latitude,
      this.phone,
      this.state,
      this.street});

  factory _$BreweryDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreweryDTOImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? address_1;
  @override
  final String? address_2;
  @override
  final String? address_3;
  @override
  final String city;
  @override
  final String country;
  @override
  final String? longitude;
  @override
  final String? latitude;
  @override
  final String? phone;
  @override
  final String? state;
  @override
  final String? street;

  @override
  String toString() {
    return 'BreweryDTO(id: $id, name: $name, address_1: $address_1, address_2: $address_2, address_3: $address_3, city: $city, country: $country, longitude: $longitude, latitude: $latitude, phone: $phone, state: $state, street: $street)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreweryDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address_1, address_1) ||
                other.address_1 == address_1) &&
            (identical(other.address_2, address_2) ||
                other.address_2 == address_2) &&
            (identical(other.address_3, address_3) ||
                other.address_3 == address_3) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.street, street) || other.street == street));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address_1, address_2,
      address_3, city, country, longitude, latitude, phone, state, street);

  /// Create a copy of BreweryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreweryDTOImplCopyWith<_$BreweryDTOImpl> get copyWith =>
      __$$BreweryDTOImplCopyWithImpl<_$BreweryDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreweryDTOImplToJson(
      this,
    );
  }
}

abstract class _BreweryDTO implements BreweryDTO {
  const factory _BreweryDTO(
      {required final String id,
      required final String name,
      final String? address_1,
      final String? address_2,
      final String? address_3,
      required final String city,
      required final String country,
      final String? longitude,
      final String? latitude,
      final String? phone,
      final String? state,
      final String? street}) = _$BreweryDTOImpl;

  factory _BreweryDTO.fromJson(Map<String, dynamic> json) =
      _$BreweryDTOImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get address_1;
  @override
  String? get address_2;
  @override
  String? get address_3;
  @override
  String get city;
  @override
  String get country;
  @override
  String? get longitude;
  @override
  String? get latitude;
  @override
  String? get phone;
  @override
  String? get state;
  @override
  String? get street;

  /// Create a copy of BreweryDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreweryDTOImplCopyWith<_$BreweryDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BreweriesMeta _$BreweriesMetaFromJson(Map<String, dynamic> json) {
  return _BreweriesMeta.fromJson(json);
}

/// @nodoc
mixin _$BreweriesMeta {
  String get total => throw _privateConstructorUsedError;

  /// Serializes this BreweriesMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreweriesMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreweriesMetaCopyWith<BreweriesMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreweriesMetaCopyWith<$Res> {
  factory $BreweriesMetaCopyWith(
          BreweriesMeta value, $Res Function(BreweriesMeta) then) =
      _$BreweriesMetaCopyWithImpl<$Res, BreweriesMeta>;
  @useResult
  $Res call({String total});
}

/// @nodoc
class _$BreweriesMetaCopyWithImpl<$Res, $Val extends BreweriesMeta>
    implements $BreweriesMetaCopyWith<$Res> {
  _$BreweriesMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreweriesMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreweriesMetaImplCopyWith<$Res>
    implements $BreweriesMetaCopyWith<$Res> {
  factory _$$BreweriesMetaImplCopyWith(
          _$BreweriesMetaImpl value, $Res Function(_$BreweriesMetaImpl) then) =
      __$$BreweriesMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String total});
}

/// @nodoc
class __$$BreweriesMetaImplCopyWithImpl<$Res>
    extends _$BreweriesMetaCopyWithImpl<$Res, _$BreweriesMetaImpl>
    implements _$$BreweriesMetaImplCopyWith<$Res> {
  __$$BreweriesMetaImplCopyWithImpl(
      _$BreweriesMetaImpl _value, $Res Function(_$BreweriesMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of BreweriesMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_$BreweriesMetaImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BreweriesMetaImpl implements _BreweriesMeta {
  const _$BreweriesMetaImpl({required this.total});

  factory _$BreweriesMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreweriesMetaImplFromJson(json);

  @override
  final String total;

  @override
  String toString() {
    return 'BreweriesMeta(total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreweriesMetaImpl &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total);

  /// Create a copy of BreweriesMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreweriesMetaImplCopyWith<_$BreweriesMetaImpl> get copyWith =>
      __$$BreweriesMetaImplCopyWithImpl<_$BreweriesMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreweriesMetaImplToJson(
      this,
    );
  }
}

abstract class _BreweriesMeta implements BreweriesMeta {
  const factory _BreweriesMeta({required final String total}) =
      _$BreweriesMetaImpl;

  factory _BreweriesMeta.fromJson(Map<String, dynamic> json) =
      _$BreweriesMetaImpl.fromJson;

  @override
  String get total;

  /// Create a copy of BreweriesMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreweriesMetaImplCopyWith<_$BreweriesMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
