import 'package:f03_lugares/models/place.dart';
import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import 'countries_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Place> favoritePlaces;

  const TabsScreen(this.favoritePlaces);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _indexSelectedScreen = 0;

  late List<Widget> _screens;
  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  @override
  void initState() {
    super.initState();
    _screens = [CountriesScreen(), FavoriteScreen(widget.favoritePlaces)];
  }

  _selectScreen(int index) {
    setState(() {
      _indexSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_indexSelectedScreen],
        ),
      ),
      body: _screens[_indexSelectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _indexSelectedScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Países'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
