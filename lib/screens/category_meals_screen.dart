import 'package:flutter/material.dart';
import 'package:nav_meals/models/meal.dart';
import 'package:nav_meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var isInitialized = false;
  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      super.didChangeDependencies();
      isInitialized = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index], _removeMeal);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
