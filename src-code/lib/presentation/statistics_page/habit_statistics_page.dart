import 'package:ahapp3/presentation/auth.dart';
import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitStatisticsPage extends StatefulWidget {
  final String habitId;
  final String habitName;

  const HabitStatisticsPage({Key? key, required this.habitId, required this.habitName}) : super(key: key);
  @override
  _HabitStatisticsPageState createState() => _HabitStatisticsPageState();
}

class _HabitStatisticsPageState extends State<HabitStatisticsPage> {
  final User? user = Auth().currentUser;
  final _uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  DateTime today = DateTime.now();
  DateTime? habitStartDate; 
  List<DateTime> markedDates = [];

  int streakCount = 0; 
  List<DateTime> skippedDates = []; 
  List<DateTime> streakDates = []; 

  @override
  void initState() {
    super.initState();
    // loadHabitStartDate();
    loadHabitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habitName),
      ),
      body: statCalendar(),
    
    );
  }


  Widget statCalendar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // Text(habitStartDate.toString());
        children: [
          Container(
            child: TableCalendar(
              focusedDay: today,
              firstDay: DateTime.utc(2015, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(color: Colors.black),

                todayDecoration: BoxDecoration(
                  color: Colors.transparent, 
                  border: Border.fromBorderSide(BorderSide(color: Colors.transparent)),
                ),
              ),
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  // Convert date to DateTime object containing only year, month and day
                  final justDate = DateTime(date.year, date.month, date.day);

                  bool isSkipped = skippedDates.any((d) => isSameDay(d, justDate));
                  bool isStreak = streakDates.any((d) => isSameDay(d, justDate));
                  bool isMarked = markedDates.any((markedDate) => isSameDay(markedDate, justDate));

                  List<Widget> markers = [];

                  if (isSameDay(date, today)) {
                    markers.add(
                      Positioned(
                        right: 23,
                        bottom: 0,
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  }

                  if (isMarked) {
                    markers.add(_buildMarker(color: Colors.lightGreen, text: '${date.day}'));
                  } if (isSkipped) {
                    markers.add(_buildMarker(color: Colors.grey, text: '${date.day}'));
                  } if (isStreak) {
                    markers.add(_buildMarker(color: Colors.blue, text: '${date.day}'));
                  }

                  if (markers.isEmpty) {
                    return null;
                  } else {
                    return Stack(children: markers);
                  }

                },
              ),
            ),
          ),
          SizedBox(height: 20), 
          habitStartDate != null
              ? Text("Create Date: ${DateFormat('yyyy-MM-dd').format(habitStartDate!)}") // 显示创建日期
              : Text("Create Date: Not available"), 
          SizedBox(height: 8),
          Text("Streak: $streakCount"), 
        ]
      ),
    );
  }

  Widget _buildMarker({required Color color, required String text}) {
    return Container(
      margin: const EdgeInsets.all(6.0), 
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color, 
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white), // 文本样式
        ),
      ),
    );
  }



  Future<void> loadHabitData() async {
    try {
      DateTime startDate = await DatabaseService(uid: _uid)
        .getHabitStartDate(widget.habitId);
      List<int> daysOfWeek = await DatabaseService(uid: _uid)
        .getHabitDaysOfWeek(widget.habitId);
      int streakCount = await DatabaseService(uid: _uid).getHabitStreakCount(widget.habitId);
      List<String> skippedDatesStr = await DatabaseService(uid: _uid).getSkippedDates(widget.habitId);
      List<String> streakDatesStr = await DatabaseService(uid: _uid).getStreakDates(widget.habitId);
      skippedDates = skippedDatesStr.map((d) => DateFormat('yyyy-MM-dd').parse(d)).toList();
      streakDates = streakDatesStr.map((d) => DateFormat('yyyy-MM-dd').parse(d)).toList();

      
      List<DateTime> calculatedMarkedDates = getMarkedDates(
        startDate, 
        // DateTime.utc(2024,4,4),
        daysOfWeek, 
        // DateTime.utc(2024,4,14)
        today
      );

      if (mounted) {
        setState(() {
          habitStartDate = startDate;
          markedDates = calculatedMarkedDates;
          this.streakCount = streakCount; 
        });
      }
    } catch (e) {
      print("Error loading habit data: $e");
    }
  }


  List<DateTime> getMarkedDates(DateTime startDate, List<int> daysOfWeek, DateTime endDate) {
    
    List<DateTime> markedDates = [];

    // Make sure to include startDate if it's within a valid date range
    if (startDate.isBefore(endDate) || isSameDay(startDate, endDate)) {
        // If startDate is a valid habit execution day, mark
        if (daysOfWeek.contains(startDate.weekday)) {
            markedDates.add(startDate);
        }
    }

    // Include today (if it is a valid custom execution day and is between startDate and endDate)
    if (daysOfWeek.contains(today.weekday) &&
        (today.isAfter(startDate) || isSameDay(today, startDate)) &&
        (today.isBefore(endDate) || isSameDay(today, endDate))) {
        // Prevent duplicate addition of today
        if (!markedDates.any((date) => isSameDay(date, today))) {
            markedDates.add(today);
        }
    }

    // Traverse every day from startDate to endDate
    DateTime currentDate = startDate;
    while (currentDate.isBefore(endDate) || isSameDay(currentDate, endDate)) {
        if (daysOfWeek.contains(currentDate.weekday)) {
            // Prevent repeated addition of startDate and today
            if (!isSameDay(currentDate, startDate) && !isSameDay(currentDate, today)) {
                markedDates.add(currentDate);
            }
        }
        currentDate = currentDate.add(Duration(days: 1));
    }

    return markedDates;
  }


}