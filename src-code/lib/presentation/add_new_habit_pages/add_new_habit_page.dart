import "package:flutter/material.dart";
import 'package:ahapp3/core/app_export.dart';

class NewHabitPage extends StatelessWidget {
  const NewHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Habit'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Try one of our suggestions:',
                  style: TextStyle(fontSize: 18)),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.habitSearchPageRoute);
                },
                child: const Text('Search for more'),
              ),
              Spacer(),
              const Text('Or:', style: TextStyle(fontSize: 18)),
              SizedBox(height: 30.v),
              _customHabitButton(context),
              SizedBox(height: 30.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customHabitButton(context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.customHabitPageRoute);
      },
      child: const Text("Add a Custom Habit", style: TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 1, 82, 148),
        fixedSize: Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Larger corner radius
        ),
      ),
    );
  }
}
