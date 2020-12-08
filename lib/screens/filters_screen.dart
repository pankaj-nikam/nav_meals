import 'package:flutter/material.dart';
import 'package:nav_meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/Filter';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                _glutenFree,
                'Gluten Free',
                'Only include gluten-free meals.',
                (value) {
                  setState(
                    () {
                      _glutenFree = value;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                _lactoseFree,
                'Lactose Free',
                'Only include lactose-free meals.',
                (value) {
                  setState(
                    () {
                      _lactoseFree = value;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                _vegetarian,
                'Vegetarian',
                'Only include vegetarian meals.',
                (value) {
                  setState(
                    () {
                      _vegetarian = value;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                _vegan,
                'Vegan',
                'Only include vegan meals.',
                (value) {
                  setState(
                    () {
                      _vegan = value;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile _buildSwitchListTile(
      bool value, String title, String subTitle, Function onChanged) {
    return SwitchListTile.adaptive(
      value: value,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: onChanged,
    );
  }
}
