import "package:flutter/material.dart";
import 'package:ahapp3/routes/app_routes.dart';

class HabitSearchPage extends StatelessWidget {
  const HabitSearchPage({Key? key}) : super(key: key);

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
            const Text('Search'),
            const Text('Not what you\'re looking for?'),
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
