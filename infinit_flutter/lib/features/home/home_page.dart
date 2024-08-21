import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinit_flutter/features/breweries_list/breweries_list_page.dart';
import 'package:infinit_flutter/features/dashboard/dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    const tabs = [
      DashboardPage(),
      BreweriesListPage(),
    ];

    return Scaffold(
      body: tabs[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (value) {
          setState(() {
            _tabIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Breweries',
            icon: Icon(Icons.list),
          ),
        ],
      ),
    );
  }
}
