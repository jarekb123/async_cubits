// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:infinit_flutter/api_client/open_brewery_db_api.dart' as _i335;
import 'package:infinit_flutter/di/api_client_module.dart' as _i506;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiClientModule = _$ApiClientModule();
    gh.lazySingleton<_i361.Dio>(() => apiClientModule.dio());
    gh.factory<_i335.OpenBreweryDbApi>(
        () => apiClientModule.mealDbApi(gh<_i361.Dio>()));
    return this;
  }
}

class _$ApiClientModule extends _i506.ApiClientModule {}
