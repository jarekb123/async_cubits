import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_brewery_db_api_models.freezed.dart';
part 'open_brewery_db_api_models.g.dart';

@freezed
class BreweryDTO with _$BreweryDTO {
  const factory BreweryDTO({
    required String id,
    required String name,
    String? address_1,
    String? address_2,
    String? address_3,
    required String city,
    required String country,
    String? longitude,
    String? latitude,
    String? phone,
    String? state,
    String? street,
  }) = _BreweryDTO;

  factory BreweryDTO.fromJson(Map<String, dynamic> json) =>
      _$BreweryDTOFromJson(json);
}

@freezed
class BreweriesMeta with _$BreweriesMeta {
  const factory BreweriesMeta({
    required String total,
  }) = _BreweriesMeta;

  factory BreweriesMeta.fromJson(Map<String, dynamic> json) =>
      _$BreweriesMetaFromJson(json);
}
