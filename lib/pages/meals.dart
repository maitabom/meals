import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class MealsPage extends StatelessWidget {
  final List<Meal> meals;

  const MealsPage(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final mealsAvailable = meals.where((meal) {
      return meal.categories.contains(category);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
      ),
      body: ListView.builder(
        itemCount: mealsAvailable.length,
        itemBuilder: (context, index) {
          return MealItem(mealsAvailable[index], category.color);
        },
      ),
    );
  }
}
