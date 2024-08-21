import 'package:dio/dio.dart';
import 'package:infinit_flutter/api_client/open_brewery_db_api_models.dart';
import 'package:retrofit/retrofit.dart';

part 'open_brewery_db_api.g.dart';

@RestApi(
  baseUrl: 'https://api.openbrewerydb.org/v1/',
)
abstract class OpenBreweryDbApi {
  @GET('breweries')
  Future<List<BreweryDTO>> search({
    @Query('by_country') String? country,
    @Query('by_name') String? name,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
  });

  @GET('breweries/{id}')
  Future<BreweryDTO> details({
    @Path() required String id,
  });

  @GET('breweries/meta')
  Future<BreweriesMeta> meta();

  factory OpenBreweryDbApi(Dio dio, {String? baseUrl}) = _OpenBreweryDbApi;
}
