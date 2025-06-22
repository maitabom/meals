import 'package:meals/models/category.dart';
import 'package:meals/models/complexity.dart';
import 'package:meals/models/cost.dart';

class Meal {
  final String id;
  final List<Category> categories;
  final String title;
  final String image;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegan;
  final bool vegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.glutenFree,
    required this.lactoseFree,
    required this.vegan,
    required this.vegetarian,
    required this.complexity,
    required this.cost,
  });

  String get nameComplexity {
    switch (complexity) {
      case Complexity.simple:
        return 'Simples';

      case Complexity.medium:
        return 'Normal';

      case Complexity.difficult:
        return 'Difícil';
    }
  }

  String get nameCost {
    switch (cost) {
      case Cost.expensive:
        return 'Caro';

      case Cost.cheap:
        return 'Barato';

      case Cost.fair:
        return 'Justo';
    }
  }
}
