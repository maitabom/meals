import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailPageArguments {
  final Meal meal;
  final Color color;

  MealDetailPageArguments({required this.meal, required this.color});
}

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as MealDetailPageArguments;
    final meal = args.meal;
    final color = args.color;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title), backgroundColor: color),
      body: Center(child: Text(meal.title)),
    );
  }
}
