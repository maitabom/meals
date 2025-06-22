import 'package:flutter/material.dart';
import 'package:meals/pages/categories.dart';
import 'package:meals/pages/meal.dart';
import 'package:meals/pages/meals.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 4, 5, 5),
          secondary: Colors.amber,
        ),
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
          titleMedium: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
        ),
      ),
      home: CategoriesPage(),
      routes: {
        '/categories-meals': (context) => MealsPage(),
        '/meal-detail': (context) => MealDetailPage(),
      }, //HomePage(),
    );
  }
}
