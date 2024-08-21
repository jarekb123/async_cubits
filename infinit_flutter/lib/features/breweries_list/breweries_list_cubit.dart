import 'package:infinit_flutter/api_client/open_brewery_db_api.dart';
import 'package:infinit_flutter/api_client/open_brewery_db_api_models.dart';
import 'package:infinit_flutter/common/pagination_cubit/pagination_cubit.dart';

class BreweriesListPageKey {
  final String? name;
  final int page;

  BreweriesListPageKey({required this.name, required this.page});
}

class BreweriesListCubit
    extends PaginationCubit<BreweriesListPageKey, BreweryDTO> {
  final OpenBreweryDbApi _api;

  BreweriesListCubit(this._api);

  @override
  Future<PaginatedResult<BreweriesListPageKey, BreweryDTO>> query(
    BreweriesListPageKey pageKey,
  ) async {
    final breweries = await _api.search(
      name: pageKey.name,
      page: pageKey.page,
      perPage: 10,
    );

    return PaginatedResult(
      items: breweries,
      nextPageKey: breweries.length == 10
          ? BreweriesListPageKey(
              name: pageKey.name,
              page: pageKey.page + 1,
            )
          : null,
    );
  }
}
