import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:ahapp3/core/app_export.dart';

class StatisticsDetailPage extends StatefulWidget {
  final String habitName;
  final int habitStreak;
  final List<String> streakList;

  const StatisticsDetailPage(
      {Key? key,
      required this.habitName,
      required this.habitStreak,
      required this.streakList})
      : super(key: key);

  @override
  State<StatisticsDetailPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsDetailPage> {
  final DatabaseService dbService =
      DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habitName),
      ),
      body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            SizedBox(height: 5),
            const Text('Completion History', style: TextStyle(fontSize: 26)),
            SizedBox(height: 40),

            //***TODO Add calendar here***

            Text('Current Streak: ' + (widget.habitStreak).toString() + ' days',
                style: TextStyle(fontSize: 15)),
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
}
