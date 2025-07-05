import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/pages/categories.dart';
import 'package:meals/pages/favorites.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsPage(this.favoriteMeals, {super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int selectedScreenIndex = 0;

  late List<Map<String, Object>> screens;

  @override
  void initState() {
    super.initState();

    screens = [
      {'title': 'Lista de Categorias', 'page': CategoriesPage()},
      {'title': 'Meus Favoritos', 'page': FavoritesPage(widget.favoriteMeals)},
    ];
  }

  selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[selectedScreenIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: screens[selectedScreenIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).canvasColor,
        currentIndex: selectedScreenIndex,
        onTap: selectScreen,
        items: [
          BottomNavigationBarItem(
            label: 'Categorias',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(label: 'Favoritos', icon: Icon(Icons.star)),
        ],
      ),
    );
  }
}
