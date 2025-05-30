import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //initiate the initial state of the object witch is empty list in this case
  FavoriteMealsNotifier() : super([]);

  //state hold the data value
  bool toggleFavoriteMealStatus(Meal meal) {
    final isMealExist = state.contains(meal);

    if (isMealExist) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

//initialize StateNotifierProvider object
//StateNotifierProvider need a Notifier class to work with
final favoriteMealsProvider =
//StateNotifierProvider has two generic types, first is the Notifier class and second is the data type that the Notifier will hold
StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
