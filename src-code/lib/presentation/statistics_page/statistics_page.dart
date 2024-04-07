import 'package:ahapp3/presentation/statistics_page/habit_statistics_page.dart';
import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ahapp3/routes/app_routes.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {

  final DatabaseService dbService = DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid ?? '');
  List<Map<String, String>> habits = [];

  @override
  void initState() {
    super.initState();
    fetchUserHabits();
  }

  void fetchUserHabits() async {
    var fetchedHabits = await dbService.getUserHabits();
    setState(() {
      habits = fetchedHabits;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          var habit = habits[index];
          return Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, 
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              alignment: Alignment.centerLeft, // Align the icon and text to the left
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Padding inside the button
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HabitStatisticsPage(
                      habitId: habit['id']!,
                      habitName: habit['name']!,
                    ),
                  ),
                );
              },
              child: Text(habit['name'] ?? 'Unnamed Habit'),
            ),
          );
        },
      ),
    );
  }

}