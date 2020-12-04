import 'package:flutter/material.dart';
import 'package:nav_meals/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/Filter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
