import 'package:ahapp3/presentation/auth.dart';
import 'package:ahapp3/routes/app_routes.dart';
import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitStatisticsPage extends StatefulWidget {
  final String habitId;
  final String habitName;

  const HabitStatisticsPage(
      {Key? key, required this.habitId, required this.habitName})
      : super(key: key);
  @override
  _HabitStatisticsPageState createState() => _HabitStatisticsPageState();
}

class _HabitStatisticsPageState extends State<HabitStatisticsPage> {
  final User? user = Auth().currentUser;
  final DatabaseService dbService =
      DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid ?? '');
  DateTime today = DateTime.now();
  DateTime? habitStartDate;
  List<DateTime> markedDates = [];

  int streakCount = 0;
  List<DateTime> skippedDates = [];
  List<DateTime> streakDates = [];

  List<int> daysOfWeek = [];

  @override
  void initState() {
    super.initState();
    loadHabitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.habitName,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 1, 82, 148),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.density_medium_sharp),
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
                barrierColor: Colors.black38,
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (_, __, ___) {
                  return SafeArea(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: AppBar().preferredSize.height + 10, right: 10),
                        child: Material(
                          type: MaterialType.transparency,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 100,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    // Handle edit logic here
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.customHabitPageRoute,
                                      arguments: {
                                        'habitId': '',
                                        'userHabitId': widget.habitId,
                                      },
                                    );
                                  },
                                  child: Text('Edit Habit',
                                      style: TextStyle(color: Colors.black)),
                                ),
                                Divider(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    // Handle delete logic here
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Confirm Deletion"),
                                          content: Text(
                                              "You are almost there! Are you sure you want to delete this habit permanently?"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text("Yes",
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                              onPressed: () async {
                                                await dbService.deleteHabit(
                                                    widget.habitId);
                                                Navigator.of(context).pop();
                                                Navigator.of(context)
                                                    .pushNamedAndRemoveUntil(
                                                        AppRoutes.homePageRoute,
                                                        (Route<dynamic>
                                                                route) =>
                                                            false); // 返回主页并移除所有之前的页面
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text('Delete Habit',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: statCalendar(),
    );
  }

  Widget statCalendar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        Text(
          "Today is: " + DateFormat('yyyy-MM-dd').format(today),
          style: TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 1, 82, 148),
          ),
        ),
        Container(
          child: TableCalendar(
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            focusedDay: today,
            firstDay: DateTime.utc(2015, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              todayTextStyle: TextStyle(color: Colors.black),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.fromBorderSide(
                    BorderSide(color: Colors.transparent)),
              ),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                final justDate = DateTime(date.year, date.month, date.day);
                bool isSkipped =
                    skippedDates.any((d) => isSameDay(d, justDate));
                bool isStreak = streakDates.any((d) => isSameDay(d, justDate));
                bool isDayOfWeek = daysOfWeek.contains(justDate.weekday);
                bool isToday = isSameDay(
                    justDate, DateTime(today.year, today.month, today.day));

                Color textColor = isDayOfWeek ? Colors.lightBlue : Colors.black;

                List<Widget> marker = [
                  Text(
                    '${date.day}',
                    style: TextStyle(color: textColor),
                  ),
                ];

                if (isToday) {
                  // Add a small red dot for today's date
                  marker.add(Positioned(
                    right: 12,
                    bottom: -8,
                    child: Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ));
                }
                if (isSkipped) {
                  marker.add(
                      _buildMarker(color: Colors.grey, text: '${date.day}'));
                } else if (isStreak) {
                  marker.add(_buildMarker(
                      color: Colors.lightGreen, text: '${date.day}'));
                }

                return Container(
                  margin: const EdgeInsets.all(1.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Stack(
                      alignment: Alignment.center,
                      children: marker,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        habitStartDate != null
            ? Text(
                "Create Date: ${DateFormat('yyyy-MM-dd').format(habitStartDate!)}",
                style: TextStyle(color: Color.fromARGB(255, 1, 82, 148)))
            : Text("Create Date: Not available",
                style: TextStyle(color: Color.fromARGB(255, 1, 82, 148))),
        SizedBox(height: 8),
        Text("Streak: $streakCount",
            style: TextStyle(color: Color.fromARGB(255, 1, 82, 148))),
      ]),
    );
  }

  bool isOutsideRange(DateTime date, DateTime firstDay, DateTime lastDay) {
    return date.month < firstDay.month || date.month > lastDay.month;
  }

  Widget _buildMarker({required Color color, required String text}) {
    return Container(
      margin: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> loadHabitData() async {
    try {
      DateTime startDate = await dbService.getHabitStartDate(widget.habitId);
      daysOfWeek = await dbService.getHabitDaysOfWeek(widget.habitId);
      int streakCount = await dbService.getHabitStreakCount(widget.habitId);
      List<String> skippedDatesStr =
          await dbService.getSkippedDates(widget.habitId);
      List<String> streakDatesStr =
          await dbService.getStreakDates(widget.habitId);
      skippedDates = skippedDatesStr
          .map((d) => DateFormat('yyyy-MM-dd').parse(d))
          .toList();
      streakDates =
          streakDatesStr.map((d) => DateFormat('yyyy-MM-dd').parse(d)).toList();

      if (mounted) {
        setState(() {
          habitStartDate = startDate;
          this.streakCount = streakCount;
        });
      }
    } catch (e) {
      print("Error loading habit data: $e");
    }
  }
}
