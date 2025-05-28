import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.meals,
    this.title,
    required this.toggleFavoriteMeal,
  });

  final String? title;
  final List<Meal> meals;
  final Function(Meal meal) toggleFavoriteMeal;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        'No meal exist in this category!!',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 20,
        ),
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder:
            (ctx, index) =>
            // Text(
            //   meals[index].title,
            //   style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
            //     color: Theme.of(ctx).colorScheme.onSurface,
            //     fontSize: 20,
            //   ),
            // ),
            MealItem(
              meal: meals[index],
              toggleFavoriteMeal: toggleFavoriteMeal,
            ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
