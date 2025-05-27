import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.meals, required this.title});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title)), body: ListView());
  }
}
