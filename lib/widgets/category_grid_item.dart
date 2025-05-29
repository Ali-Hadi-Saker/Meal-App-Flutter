import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/screens/meal_screen.dart';

class CategoryGridItem extends ConsumerWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.toggleFavoriteMeal,
  });

  final Category category;
  final Function(Meal meal) toggleFavoriteMeal;

  //context is not available in the constructor, so we need to pass it to the method
  //this method is called when the user taps on the category item
  void _onSelectCategory(
    BuildContext context,
    Category category,
    List<Meal> meals,
  ) {
    //filter the meals based on the selected category
    final filterdMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (ctx) => MealScreen(
              meals: filterdMeals,
              title: category.title,
              toggleFavoriteMeal: toggleFavoriteMeal,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = ref.watch(mealProvider);
    return InkWell(
      onTap: () => _onSelectCategory(context, category, meals),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha((255 * 0.5).toInt()),
              category.color.withAlpha((255 * 0.9).toInt()),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
