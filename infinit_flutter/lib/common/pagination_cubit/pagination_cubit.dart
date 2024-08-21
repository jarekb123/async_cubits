import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_cubit.freezed.dart';

abstract class PaginationCubit<PageKey, ItemType>
    extends Cubit<PaginationState<PageKey, ItemType>> {
  PaginationCubit()
      : super(
          PaginationState(
            items: [],
            nextPageKey: null,
            isFetchingNextPage: true,
          ),
        );

  /// Loads the page with the given [pageKey].
  ///
  /// It returns a [PaginatedResult] with the items and the next page key.
  @protected
  Future<PaginatedResult<PageKey, ItemType>> query(PageKey pageKey);

  /// Resets the state (clears the list of items) and fetches the first page with the given [pageKey].
  Future<void> fetchFirstPage(PageKey pageKey) {
    emit(state.copyWith(
      items: [],
      nextPageKey: null,
      isFetchingNextPage: true,
    ));

    return _performQuery(pageKey);
  }

  /// Fetches the next page if the previous result has a next page key.
  Future<void> fetchNextPage() async {
    final nextPageKey = state.nextPageKey;

    if (!state.isFetchingNextPage && nextPageKey != null) {
      emit(
        state.copyWith(isFetchingNextPage: true),
      );

      return _performQuery(nextPageKey);
    }
  }

  Future<void> _performQuery(PageKey pageKey) async {
    try {
      final result = await query(pageKey);

      emit(
        state.copyWith(
          items: [...state.items, ...result.items],
          nextPageKey: result.nextPageKey,
          isFetchingNextPage: false,
        ),
      );
    } catch (e, st) {
      emit(
        state.copyWith(
          isFetchingNextPage: false,
          error: e,
        ),
      );

      onError(e, st);
    }
  }
}

@freezed
class PaginationState<PageKey, ItemType>
    with _$PaginationState<PageKey, ItemType> {
  const factory PaginationState({
    required List<ItemType> items,
    required PageKey? nextPageKey,
    required bool isFetchingNextPage,
    Object? error,
  }) = _PaginationState<PageKey, ItemType>;

  const PaginationState._();

  bool get isLoadingFirstPage => items.isEmpty && isFetchingNextPage;
  bool get hasNextPage => nextPageKey != null;
  bool get hasError => error != null;
  bool get isEmpty => items.isEmpty;
}

@freezed
class PaginatedResult<PageKey, ItemType>
    with _$PaginatedResult<PageKey, ItemType> {
  const factory PaginatedResult({
    required List<ItemType> items,
    required PageKey? nextPageKey,
  }) = _PaginatedResult<PageKey, ItemType>;
}
