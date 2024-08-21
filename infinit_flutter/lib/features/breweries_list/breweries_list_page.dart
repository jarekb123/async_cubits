import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_flutter/di/di.dart';
import 'package:infinit_flutter/features/breweries_list/breweries_list_cubit.dart';
import 'package:infinit_flutter/features/breweries_list/widgets/breweries_list_view.dart';

class BreweriesListPage extends StatelessWidget {
  const BreweriesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BreweriesListCubit(inject())
        ..fetchFirstPage(
          BreweriesListPageKey(name: '', page: 1),
        ),
      child: const BreweriesListPageBody(),
    );
  }
}

class BreweriesListPageBody extends StatelessWidget {
  const BreweriesListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breweries'),
      ),
      body: const BreweriesListView(searchQuery: ''),
    );
  }
}
