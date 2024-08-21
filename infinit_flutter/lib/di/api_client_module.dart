import 'package:dio/dio.dart';
import 'package:infinit_flutter/api_client/open_brewery_db_api.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiClientModule {
  @lazySingleton
  Dio dio() => Dio();

  OpenBreweryDbApi mealDbApi(Dio dio) => OpenBreweryDbApi(dio);
}
