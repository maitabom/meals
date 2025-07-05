import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/pages/meal.dart';
import 'package:meals/pages/meals.dart';
import 'package:meals/pages/settings.dart';
import 'package:meals/pages/tabs.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Settings settings = Settings();
  List<Meal> availableMeals = dummyMeals;
  List<Meal> favoriteMeals = [];

  void applySettings(Settings settings) {
    setState(() {
      this.settings = settings;

      availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.glutenFree && !meal.glutenFree;
        final filterLactose = settings.lactoseFree && !meal.lactoseFree;
        final vegan = settings.vegan && !meal.vegan;
        final vegetarian = settings.vegetarian && !meal.vegetarian;

        return !filterGluten && !filterLactose && !vegan && !vegetarian;
      }).toList();
    });
  }

  void toggleFavorite(Meal meal) {
    setState(() {
      if (favoriteMeals.contains(meal)) {
        favoriteMeals.remove(meal);
      } else {
        favoriteMeals.add(meal);
      }
    });
  }

  bool isFavorite(Meal meal) {
    return favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 4, 5, 5),
          secondary: Colors.amber,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.pink;
            }

            return Colors.grey;
          }),
          trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.pink.shade200;
            }

            return Colors.grey.shade300;
          }),
        ),
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
          titleMedium: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
          titleSmall: TextStyle(fontFamily: 'RobotoCondensed'),
        ),
      ),
      home: TabsPage(favoriteMeals),
      routes: {
        '/categories-meals': (context) => MealsPage(availableMeals),
        '/meal-detail': (context) => MealDetailPage(toggleFavorite, isFavorite),
        '/settings': (context) => SettingsPage(applySettings, settings),
      }, //HomePage(),
    );
  }
}
