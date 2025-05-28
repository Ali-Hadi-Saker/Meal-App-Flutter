import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        children: [
          SwitchListTile(
            value: _isGlutenFree,
            onChanged: (checked) {
              setState(() {
                _isGlutenFree = checked;
              });
            },
            title: Text('Gluten-Free'),
            subtitle: Text('Display meals with gluten-free'),
          ),
        ],
      ),
    );
  }
}
