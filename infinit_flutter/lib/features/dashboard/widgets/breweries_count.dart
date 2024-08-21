import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_flutter/di/di.dart';
import 'package:infinit_flutter/features/dashboard/breweries_count_cubit.dart';

class BreweriesCount extends StatelessWidget {
  const BreweriesCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BreweriesCountCubit(inject())..load(),
      child: const _BreweriesCount(),
    );
  }
}

class _BreweriesCount extends StatelessWidget {
  const _BreweriesCount();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BreweriesCountCubit>().state;
    final count = state.value;

    if (count != null) {
      return Text(
        '$count',
        style: const TextStyle(fontSize: 24),
      );
    } else if (state.isLoading) {
      return const Text('...');
    } else {
      return const Text('Error');
    }
  }
}
