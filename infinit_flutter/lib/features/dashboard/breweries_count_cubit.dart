import 'package:async_cubits/async_cubits.dart';
import 'package:infinit_flutter/api_client/open_brewery_db_api.dart';

class BreweriesCountCubit extends FutureCubit<int> {
  final OpenBreweryDbApi _api;

  BreweriesCountCubit(this._api);

  @override
  Future<int> future() async {
    final meta = await _api.meta();
    return int.parse(meta.total);
  }
}
