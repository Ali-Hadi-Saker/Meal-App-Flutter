import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';

//Provider is used for static data like in this example where list of meals never change
final mealProvider = Provider((ref) {
  return dummyMeals;
});
