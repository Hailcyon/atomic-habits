import 'dart:io';

import "package:flutter/material.dart";
import 'package:ahapp3/routes/app_routes.dart';

class NewHabitPage extends StatelessWidget {
  const NewHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Habit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Try one of our suggestions:'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.habitSearchPageRoute);
              },
              child: const Text('Search for more'),
            ),
            const Text('Or:'),
            _customHabitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _customHabitButton(context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.customHabitPageRoute);
      },
      child: const Text("Add a Custom Habit"),
    );
  }
}
