import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:ahapp3/core/app_export.dart';

class NewHabitPage extends StatefulWidget {
  const NewHabitPage({Key? key}) : super(key: key);

  @override
  State<NewHabitPage> createState() => _NewHabitPageState();
}

class _NewHabitPageState extends State<NewHabitPage> {
  final DatabaseService dbService =
      DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Habit',
            style: TextStyle(fontSize: 22, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 1, 82, 148),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Try one of our suggestions:',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              SizedBox(height: 25),
              StreamBuilder<List<Map<String, String>>>(
                  stream: dbService.getSuggestedHabits(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong: ${snapshot.error}");
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text(
                          "No habits found"); // Handle case where no data is available
                    }
                    List<Widget> habitWidgets = [];
                    int habitsToAdd =
                        snapshot.data!.length < 4 ? snapshot.data!.length : 4;

                    for (int index = 0; index < habitsToAdd; index++) {
                      final habit = snapshot.data![index];
                      final habitId = habit['id']!; // Extract the habit ID

                      // Add the habit button
                      habitWidgets.add(_suggestedHabitButton(
                        context: context,
                        habitId: habitId, // Pass the habit ID
                      ));

                      // Add spacing after the button
                      if (index < snapshot.data!.length) {
                        habitWidgets.add(SizedBox(
                            height:
                                10)); // Adjust the height for desired spacing
                      }
                    }
                    return Column(
                      children: habitWidgets,
                    );
                  }),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.habitSearchPageRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1))),
                  child: Text(
                    'Search for more',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              Spacer(),
              const Text('Or:',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              SizedBox(height: 30.v),
              _customHabitButton(context),
              SizedBox(height: 30.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget _suggestedHabitButton({
    required BuildContext context,
    required String habitId,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          AppRoutes.customHabitPageRoute,
          arguments: {
            'habitId': habitId,
            'userHabitId': '',
          },
        );
      },
      child: Text(habitId, style: TextStyle(fontSize: 20, color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 248, 213, 17),
        fixedSize: Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Larger corner radius
        ),
      ),
    );
  }

  Widget _customHabitButton(context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          AppRoutes.customHabitPageRoute,
          arguments: {
            'habitId': '',
            'userHabitId': '',
          },
        );
      },
      child: const Text("Add a Custom Habit",
          style: TextStyle(fontSize: 20, color: Colors.white)),
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