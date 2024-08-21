import 'package:async_cubits/async_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_flutter/api_client/open_brewery_db_api_models.dart';
import 'package:infinit_flutter/di/di.dart';
import 'package:infinit_flutter/features/brewery_details/brewery_details_cubit.dart';

class BreweryDetailsPage extends StatelessWidget {
  const BreweryDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreweryDetailsCubit(inject(), id: id)..load(),
      child: const BreweryDetailsPageBody(),
    );
  }
}

class BreweryDetailsPageBody extends StatelessWidget {
  const BreweryDetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brewery details'),
      ),
      body: BlocBuilder<BreweryDetailsCubit, AsyncValue<BreweryDTO>>(
        builder: (context, state) {
          final brewery = state.value;

          if (brewery != null) {
            return _BreweryDetailsBody(data: brewery);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _BreweryDetailsBody extends StatelessWidget {
  const _BreweryDetailsBody({super.key, required this.data});

  final BreweryDTO data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text('${data.city}, ${data.country}'),
          const SizedBox(height: 16),
          const Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.location_pin),
            title: Text('${data.latitude} ${data.longitude}'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.phone),
            title: Text('${data.phone}'),
          ),
        ],
      ),
    );
  }
}
