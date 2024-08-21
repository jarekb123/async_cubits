import 'package:dio/dio.dart';
import 'package:infinit_flutter/api_client/meal_db_api_models.dart';
import 'package:retrofit/retrofit.dart';

part 'meal_db_api.g.dart';

@RestApi(
  baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
)
abstract class MealDbApi {
  @GET('search.php')
  Future<MealsResult> search({
    @Query('s') required String query,
  });

  @GET('lookup.php')
  Future<MealsResult> lookup({
    @Query('i') required String id,
  });

  factory MealDbApi(Dio dio, {String? baseUrl}) = _MealDbApi;
}
