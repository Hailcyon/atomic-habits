import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/presentation/statistics_pages/habit_statistics_page.dart';

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
        title: Text(
          'Habit Streaks',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 1, 82, 148),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Column(children: [
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

                  for (int index = 0; index < snapshot.data!.length; index++) {
                    final habit = snapshot.data![index];
                    final habitName = habit['name']!; // Extract the habit name
                    final habitId = habit['id']!;

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
                      habitId: habitId,
                    ));
                    // Add spacing after the button
                    if (index < snapshot.data!.length) {
                      habitWidgets.add(SizedBox(
                          height: 20)); // Adjust the height for desired spacing
                    }
                  }
                  return Expanded(
                    child: ListView(
                      children: habitWidgets,
                    ),
                  );
                }),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 1, 82, 148),
        unselectedItemColor: Colors.grey,
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
    required habitId,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 10), // Adjust spacing between buttons
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HabitStatisticsPage(
                habitId: habitId,
                habitName: habitName,
              ),
            ),
          );
        },
        child: Padding(
          // Add padding inside the button
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    // Use expanded to allow text to span multiple lines if needed
                    child: Text(
                      habitName,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      overflow:
                          TextOverflow.ellipsis, // Use ellipsis for long texts
                      maxLines: 2, // Allow text to span up to two lines
                    )),
                SizedBox(width: 10), // Spacing between text and streak count
                Row(
                  children: [
                    Icon(
                      Icons.whatshot,
                      color: Colors.red,
                    ),
                    SizedBox(width: 3), // Spacing between the icon and text
                    Text(
                      habitStreak.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 248, 213, 17),
          // Remove the fixedSize to allow button to grow
          padding: EdgeInsets.zero, // Padding is handled inside the button now
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
        ),
      ),
    );
  }
}
