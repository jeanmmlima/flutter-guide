import 'package:f5_traveler/components/main_drawer.dart';
import 'package:f5_traveler/screens/countries_screen.dart';
import 'package:f5_traveler/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [CountriesScreen(), FavoriteScreen()];
  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /* PRIMEIRA FORMA */
    /*
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bora Viajar?'),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.category), text: 'Categorias'),
            Tab(icon: Icon(Icons.star), text: 'Favoritos'),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          CountriesScreen(),
          FavoriteScreen(),
        ]),
      ),
    );*/
    return Scaffold(
      appBar: AppBar(
          title: Text(
        _titles[_selectedScreenIndex],
      )),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex, //saber qual está selecionado
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categorias'),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos',
            ),
          ]),
      drawer: MainDrawer(),
    );
  }
}
