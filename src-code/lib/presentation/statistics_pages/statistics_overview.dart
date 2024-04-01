import 'package:ahapp3/presentation/statistics_pages/statistics_details.dart';
import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:ahapp3/core/app_export.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final DatabaseService dbService =
      DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            SizedBox(height: 5),
            const Text('Current Streaks', style: TextStyle(fontSize: 26)),
            SizedBox(height: 7),
            const Text('click a habit to view details',
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 105, 105, 105))),
            SizedBox(height: 40),
            StreamBuilder<List<Map<String, dynamic>>>(
                stream: dbService.getAllUserHabits(),
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
                    final habitName = habit['name']!; // Extract the habit ID

                    List<String> streakList =
                        List<String>.from(habit['streak'] ?? [])
                            .map((e) => e.toString())
                            .toList();
                    List<String> days = List<String>.from(habit['days'] ??
                        []); // Example: ['thursday', 'friday', 'saturday']
                    final habitStreak =
                        dbService.calculateStreakCount(streakList, days);
                    // Add the habit button
                    habitWidgets.add(_habitButton(
                      context: context,
                      habitName: habitName, // Pass the habit name
                      habitStreak: habitStreak,
                      streakList: streakList,
                    ));
                    // Add spacing after the button
                    if (index < snapshot.data!.length) {
                      habitWidgets.add(SizedBox(
                          height: 20)); // Adjust the height for desired spacing
                    }
                  }
                  return Column(
                    children: habitWidgets,
                  );
                }),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Index of the currently selected tab
        onTap: (int index) {
          if (index == 0) {
            Navigator.of(context).pushNamed(AppRoutes.homePageRoute);
          } else if (index == 1) {
            Navigator.of(context).pushNamed(AppRoutes.newHabitPageRoute);
          } else {}
          // Handle tab selection
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Habit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }

  Widget _habitButton({
    required BuildContext context,
    required String habitName,
    required int habitStreak,
    required List<String> streakList,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StatisticsDetailPage(
              habitName: habitName,
              habitStreak: habitStreak,
              streakList: streakList),
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            habitName,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Row(
            children: [
              Icon(
                Icons
                    .whatshot, // You can change this to any flame icon you prefer
                color: Colors.red, // You can change the color of the flame icon
              ),
              Text(
                habitStreak.toString(),
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 248, 213, 17),
        fixedSize: Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Larger corner radius
        ),
      ),
    );
  }
}
