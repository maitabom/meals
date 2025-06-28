import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailPageArguments {
  final Meal meal;
  final Color color;

  MealDetailPageArguments({required this.meal, required this.color});
}

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({super.key});

  Widget createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget createSectionContainer(BuildContext context, Widget child) {
    return Container(
      width: 340,
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as MealDetailPageArguments;
    final meal = args.meal;
    final color = args.color;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title), backgroundColor: color),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.image, fit: BoxFit.cover),
            ),
            createSectionTitle(context, 'Ingredientes'),
            createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            createSectionTitle(context, 'Modo de Preparo'),
            createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('${index + 1} ')),
                        title: Text(meal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
