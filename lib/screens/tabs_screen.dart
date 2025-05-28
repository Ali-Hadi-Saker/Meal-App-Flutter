import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _slectedIndex = 0;
  String _selectedTitle = 'Categories';
  List<Meal> favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleAddFavoriteMeal(Meal meal) {
    if (favoriteMeals.contains(meal)) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is removed');
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      _showInfoMessage('Meal is added');
    }
  }

  void _selectScreen(int index) {
    setState(() {
      _slectedIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filter') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleFavoriteMeal: _toggleAddFavoriteMeal,
    );
    if (_slectedIndex == 1) {
      activePage = MealScreen(
        meals: favoriteMeals,
        toggleFavoriteMeal: _toggleAddFavoriteMeal,
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
