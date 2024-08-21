// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_brewery_db_api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreweryDTOImpl _$$BreweryDTOImplFromJson(Map<String, dynamic> json) =>
    _$BreweryDTOImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address_1: json['address_1'] as String?,
      address_2: json['address_2'] as String?,
      address_3: json['address_3'] as String?,
      city: json['city'] as String,
      country: json['country'] as String,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      phone: json['phone'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$$BreweryDTOImplToJson(_$BreweryDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address_1': instance.address_1,
      'address_2': instance.address_2,
      'address_3': instance.address_3,
      'city': instance.city,
      'country': instance.country,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'phone': instance.phone,
      'state': instance.state,
      'street': instance.street,
    };

_$BreweriesMetaImpl _$$BreweriesMetaImplFromJson(Map<String, dynamic> json) =>
    _$BreweriesMetaImpl(
      total: json['total'] as String,
    );

Map<String, dynamic> _$$BreweriesMetaImplToJson(_$BreweriesMetaImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
    };
