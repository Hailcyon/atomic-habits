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
    // Extract the arguments(currentDateTime) from HomePageContainerPage
    // settings and cast them as currentDateTime
    // final argDayOfWeek = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Index of the currently selected tab
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
