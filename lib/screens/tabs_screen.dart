import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favorite_meals_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _slectedIndex = 0;
  String _selectedTitle = 'Categories';

  void _selectScreen(int index) {
    setState(() {
      _slectedIndex = index;
    });
  }

  // result is a map with Filter as key and bool as value
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filter') {
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(builder: (ctx) => FilterScreen()),
      );
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
    );
    if (_slectedIndex == 1) {
      final providedFavoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealScreen(
        meals: providedFavoriteMeals,
      );
      _selectedTitle = 'Your Favorite';
    }
    return Scaffold(
      appBar: AppBar(title: Text(_selectedTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _slectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
