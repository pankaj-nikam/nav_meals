import 'package:flutter/material.dart';
import 'package:nav_meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/MealDetail';

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle('Ingredients', context),
            _buildContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                ),
              ),
            ),
            _buildSectionTitle('Steps', context),
            _buildContainer(
              ListView.separated(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(meal.steps[index]),
                ),
                separatorBuilder: (context, index) => Divider(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(meal.id);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
