import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favorite_meals_provider.dart';

class DetailMealScreen extends ConsumerWidget {
  const DetailMealScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavoriteMealStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isAdded ? 'Meal is Added' : 'Meal is Removed'),
                ),
              );
            },
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              "Ingridients",
              style: TextStyle(
                color: const Color.fromARGB(255, 231, 159, 25),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...meal.ingredients.map(
              (ingridient) => Text(
                ingridient,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Steps",
              style: TextStyle(
                color: const Color.fromARGB(255, 231, 159, 25),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...meal.steps.map(
              (step) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  step,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
