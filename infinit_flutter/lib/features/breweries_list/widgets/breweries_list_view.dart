import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_flutter/design_system/paginated/sliver_paginated_list_view.dart';
import 'package:infinit_flutter/di/di.dart';
import 'package:infinit_flutter/features/breweries_list/breweries_list_cubit.dart';
import 'package:infinit_flutter/features/brewery_details/brewery_details_page.dart';

class BreweriesListView extends StatelessWidget {
  const BreweriesListView({super.key, required this.searchQuery});

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BreweriesListCubit(inject())
        ..fetchFirstPage(
          BreweriesListPageKey(name: searchQuery, page: 1),
        ),
      child: const _BreweriesPaginatedListView(),
    );
  }
}

class _BreweriesPaginatedListView extends StatelessWidget {
  const _BreweriesPaginatedListView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BreweriesListCubit>();
    final state = cubit.state;

    return CustomScrollView(
      slivers: [
        DSSliverPaginatedListView(
          itemsCount: state.items.length,
          itemBuilder: (context, index) {
            final brewery = state.items[index];
            return ListTile(
              title: Text(brewery.name),
              subtitle: Text(brewery.city),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BreweryDetailsPage(id: brewery.id),
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          isLoading: state.isFetchingNextPage,
          hasMoreItems: state.hasNextPage,
          hasError: state.hasError,
          onFetchNextPage: () => cubit.fetchNextPage(),
        )
      ],
    );
  }
}
