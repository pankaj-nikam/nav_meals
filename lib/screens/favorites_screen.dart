import 'package:flutter/material.dart';
import 'package:nav_meals/models/meal.dart';
import 'package:nav_meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  FavoritesScreen(this._favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _favoriteMeals.isEmpty
          ? Text('You have no favorites yet, start adding some!')
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(_favoriteMeals[index]);
              },
              itemCount: _favoriteMeals.length,
            ),
    );
  }
}
