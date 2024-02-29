import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:ahapp3/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahapp3/service/database.dart';

class HabitSearchPage extends StatefulWidget {
  const HabitSearchPage({Key? key}) : super(key: key);

  @override
  State<HabitSearchPage> createState() => _HabitSearchPageState();
}

class _HabitSearchPageState extends State<HabitSearchPage> {
  final DatabaseService dbService =
      DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid ?? '');
  // Initialize dbService with the user's UID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Habit'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _entryField('Search', TextEditingController()),
                SizedBox(height: 15),
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
                      snapshot.data!.asMap().forEach((index, habit) {
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
                      });
                      return Column(
                        children: habitWidgets,
                      );
                    }),
                SizedBox(height: 10),
                const Text('Not what you\'re looking for?',
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 30.v),
                _customHabitButton(context),
                SizedBox(height: 30.v),
              ],
            ),
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
        Navigator.of(context).pushNamed(AppRoutes.customHabitPageRoute);
      },
      child: Text(habitId, style: TextStyle(fontSize: 20, color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
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

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
