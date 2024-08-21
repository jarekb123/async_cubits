import 'package:flutter/material.dart';
import 'package:infinit_flutter/features/dashboard/widgets/breweries_count.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('We have'),
            BreweriesCount(),
            Text('breweries'),
          ],
        ),
      ),
    );
  }
}
