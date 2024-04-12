import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewAllHabitsPage extends StatefulWidget {
  const ViewAllHabitsPage({Key? key}) : super(key: key);

  @override
  State<ViewAllHabitsPage> createState() => _ViewAllHabitsPage();
}

class _ViewAllHabitsPage extends State<ViewAllHabitsPage> {

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
        title: Text('All Habits'),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          var habit = habits[index];
          return Container(
            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
            // padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 60),
                backgroundColor: Color.fromARGB(255, 248, 213, 17), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                alignment: Alignment.centerLeft, // Align the icon and text to the left
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Padding inside the button
              ),
              onPressed: () {

              },
              child: Text(
                habit['name'] ?? 'Unnamed Habit',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  
}