import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import 'countries_screen.dart';
import 'favoritos_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _indexSelectedScreen = 0;

  List<Widget> _screens = [CountriesScreen(), FavoritosScreen()];

  _selectScreen(int index) {
    setState(() {
      _indexSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Bora Viajar?')),
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
