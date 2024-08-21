import 'package:async_cubits/async_cubits.dart';
import 'package:infinit_flutter/api_client/open_brewery_db_api.dart';
import 'package:infinit_flutter/api_client/open_brewery_db_api_models.dart';

class BreweryDetailsCubit extends FutureCubit<BreweryDTO> {
  final OpenBreweryDbApi _api;
  final String id;

  BreweryDetailsCubit(
    this._api, {
    required this.id,
  });

  @override
  Future<BreweryDTO> future() => _api.details(id: id);
}
