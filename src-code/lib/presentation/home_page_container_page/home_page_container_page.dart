// import 'dart:js';

import 'package:ahapp3/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'bloc/home_page_container_bloc.dart';
import 'models/home_page_container_model.dart';
// import 'package:ahapp3/presentation/funAlertDialog.dart';

import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_title.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahapp3/presentation/auth.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ahapp3/utils/date_utils.dart' as date_util;

import 'package:flutter_svg/flutter_svg.dart';

class HomePageContainerPage extends StatefulWidget {
  HomePageContainerPage({Key? key}) : super(key: key);

  @override
  State<HomePageContainerPage> createState() => _HomePageContainerPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomePageContainerBloc>(
      create: (context) =>
          HomePageContainerBloc()..add(HomePageContainerInitialEvent()),
      child: HomePageContainerPage(),
    );
  }
}

class _HomePageContainerPageState extends State<HomePageContainerPage> {
  Map<String, bool> skippedHabits =
      {}; // Track skip status for each habit on specific date
  final User? user = Auth().currentUser;

  List<String> habitNames = [];

  final DatabaseService dbService = DatabaseService(
      uid: FirebaseAuth.instance.currentUser?.uid ??
          ''); // Initialize dbService with the user's UID;

  // new calendar
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  DateTime staticCuurentDateTime = DateTime.now();
  bool initialDateTimeChanged = false;
  TextEditingController controller = TextEditingController();
  String curDayOfWeekFullName = '';

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? "User email");
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text("Sign Out"),
    );
  }

  String getDayOfWeekFullName(DateTime dateTime) {
    List<String> daysOfWeekAbbrev = [
      "monday",
      "tuesday",
      "wednesday",
      "thursday",
      "friday",
      "saturday",
      "sunday"
    ];
    // DateTime.weekday returns an integer from 1 (Monday) to 7 (Sunday)
    return daysOfWeekAbbrev[dateTime.weekday - 1];
  }

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 45.0 * currentDateTime.day);

    curDayOfWeekFullName = getDayOfWeekFullName(currentDateTime);

    super.initState();
    fetchHabitsWithStatus();
  }

  void fetchHabitsWithStatus() async {
    String currentDayOfWeek =
        DateFormat('EEEE').format(currentDateTime).toLowerCase();
    DateTime currentDate = currentDateTime;
    String currentDateStr = DateFormat('yyyy-MM-dd').format(currentDate);

    var habitsWithStatus =
        await dbService.getHabitsWithSkipStatus(currentDayOfWeek, currentDate);

    setState(() {
      // Do not clear the current skip state map
      // Only update or add custom skip status for the current date
      for (var habit in habitsWithStatus) {
        String habitDateKey = '${habit['id']}_$currentDateStr';
        skippedHabits[habitDateKey] = habit['isSkipped'];
      }
    });
  }

  // the grey box to show days
  Widget topView() {
    return Container(
      height: height * 0.13,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey,
        boxShadow: const [
          BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
              offset: Offset(4, 4),
              spreadRadius: 2)
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleView(),
            hrizontalCapsuleListView(),
          ]),
    );
  }

  // show Month/Year
  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Text(
        // date_util.DateUtils.months[currentDateTime.month - 1] +
        //     ' ' +
        //     currentDateTime.year.toString(),
        date_util.DateUtils.months[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }

  // show days(white) and selected days(green)
  Widget hrizontalCapsuleListView() {
    return Container(
      width: width,
      height: 50,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    bool isSelected = currentMonthList[index].day == currentDateTime.day &&
        currentMonthList[index].month == currentDateTime.month &&
        currentMonthList[index].year ==
            currentDateTime.year; // Ensure the month and year match too

    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];
              // update current dayOfWeek full name
              curDayOfWeekFullName = getDayOfWeekFullName(currentDateTime);
              fetchHabitsWithStatus(); // make sure that when app reopen, button is still grayed
            });
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  // colors: (currentMonthList[index].day != currentDateTime.day)
                  colors: !isSelected
                      ? [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0.6)
                        ]
                      : [
                          Colors.green.withOpacity(0.8),
                          Colors.green.withOpacity(0.7),
                          Colors.green.withOpacity(0.6)
                        ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                  stops: const [0.0, 0.5, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currentMonthList[index].day.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? Colors.grey
                                : Colors.white),
                  ),
                  Text(
                    date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? Colors.grey
                                : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  // days and "Habits" are not scrollable now
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(children: <Widget>[
        topView(),
        SizedBox(height: 10),
        Text(
          "Habits",
          style: theme.textTheme.headlineLarge,
          textAlign: TextAlign.center, // Align text to the center
        ),
        SizedBox(height: 10),
        Expanded(
          // Use Expanded to fill the remaining space
          child: ListView(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              children: <Widget>[
                StreamBuilder<List<Map<String, String>>>(
                  stream: dbService.getHabitsAscending(curDayOfWeekFullName),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong: ${snapshot.error}");
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                            "No habits found"), // Handle case where no data is available
                      );
                    }
                    List<Widget> habitWidgets = [];
                    snapshot.data!.asMap().forEach((index, habit) {
                      final habitId = habit['id']!; // Extract the habit ID
                      final habitName =
                          habit['name']!; // Extract the habit name
                      final iconPath =
                          habit['iconPath']; // Extract the icon path
                      // Add the habit button
                      habitWidgets.add(buildHabitButton(
                        context: context,
                        habitId: habitId, // Pass the habit ID
                        habitName: habitName,
                        buttonText: habitName, // Pass the habit name
                        leftIconPath: iconPath!,
                      ));

                      // Add spacing after the button, but not after the last one
                      if (index < snapshot.data!.length - 1) {
                        habitWidgets.add(SizedBox(
                            height:
                                15)); // Adjust the height for desired spacing
                      }
                    });

                    // Return a SingleChildScrollView containing a Column of habit buttons
                    return Column(
                      children: habitWidgets,
                    );
                  },
                ),
                SizedBox(height: 100.v),
              ]),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Index of the currently selected tab
        onTap: (int index) {
          if (index == 1) {
            Navigator.of(context).pushNamed(AppRoutes.newHabitPageRoute);
          } else if (index == 2) {
            Navigator.of(context).pushNamed(AppRoutes.statisticsPageRoute);
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

  Widget buildHabitButton({
    required BuildContext context,
    required String habitId,
    required String habitName,
    required String buttonText,
    required String leftIconPath,
  }) {
    // set color based on the chosen date habit skipped status
    String currentDateStr = DateFormat('yyyy-MM-dd').format(currentDateTime);
    String habitDateKey = '${habitId}_$currentDateStr';
    Color buttonColor = skippedHabits[habitDateKey] ?? false
        ? Colors.yellow.withOpacity(0.2)
        : Colors.yellow;

    return SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      closeWhenTapped: true,
      child: Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Text("Are you sure you want to skip this habit?"),
                    actions: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: Text("Yes"),
                        onPressed: () async {
                          // delete chosen date in selected habit's streak list, maintain streak caculation
                          await dbService.skipHabitDate(
                              habitId, currentDateTime);
                          // add chosen date to skipped list of the selected habit
                          await dbService.addSkipDate(habitId, currentDateTime);
                          String currentDateStr =
                              DateFormat('yyyy-MM-dd').format(currentDateTime);
                          String habitDateKey = '${habitId}_$currentDateStr';
                          setState(() {
                            // immediately set selected habit skip status to True on chosen date
                            skippedHabits[habitDateKey] = true;
                          });
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ],
                    elevation: 24,
                  ),
                );
              }),
              backgroundColor: Colors.red,
              icon: Icons.clear_outlined,
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) async {
                _showStreakDialog(context, habitId, currentDateTime);
                // add chosen date to selected habit's streak list
                // delete chosen date in selected habit's skipped list
                await dbService.markHabitAsCompleted(habitId, currentDateTime);

                String currentDateStr =
                    DateFormat('yyyy-MM-dd').format(currentDateTime);
                String habitDateKey = '${habitId}_$currentDateStr';
                setState(() {
                  // immediately set selected habit skip status to False on chosen date
                  skippedHabits[habitDateKey] = false;
                });
              }),
              backgroundColor: Colors.green,
              icon: Icons.check,
            ),
          ],
        ),
        // build the habit button
        child: Container(
          width: 600,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          // child: Expanded( //have Expanded in Container will cause Incorrect use of ParentDataWidget error
          child: ElevatedButton.icon(
            // icon: const Icon(Icons.directions_run_rounded),
            icon: SvgPicture.asset(
              leftIconPath,
              width: 24, // set icon width
              height: 24, // set icon height
              color: Colors.pink, // set icon color
            ),
            label: Text(
              buttonText,
              style: TextStyle(color: Colors.black), // Text color
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 100,
            ),
            style: ElevatedButton.styleFrom(
              // backgroundColor: Colors.yellow, // Button color
              backgroundColor: buttonColor, // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              alignment:
                  Alignment.centerLeft, // Align the icon and text to the left
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0), // Padding inside the button
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.editHabitPageRoute,
                  arguments: {habitId, habitName});
            },
          ),
          // ),
        ),
      ),
    );
  }

  void _showStreakDialog(
      BuildContext context, String habitId, DateTime chosenDateTime) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<int>(
          future: getStreak(habitId, chosenDateTime), // Fetch the streak value
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for the streak value, show a loading indicator
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If there's an error fetching the streak value, show an error message
              return AlertDialog(
                title: Text('Error'),
                content: Text('Failed to fetch streak value.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            } else {
              // If streak value is fetched successfully, show the streak in the dialog
              int curStreak = snapshot.data!;
              return AlertDialog(
                title: Text('Congratulations!'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('You have completed the habit.'),
                    SizedBox(height: 13),
                    Text("You have a " +
                        curStreak.toString() +
                        " day streak!"), // Display the streak value
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }

// Inside an asynchronous function
  Future<int> getStreak(habitId, DateTime chosenDateTime) async {
    return await dbService.updateStreak(habitId, chosenDateTime);
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: Text('Atomic Habits', style: TextStyle(color: Colors.black)),
        height: 70.v,
        leadingWidth: 100.h,
        leading: IconButton(
          icon: Icon(Icons.settings, size: 40),
          onPressed: () {
            //Navigator.of(context).pushNamed(AppRoutes.settingsPageRoute);
            Navigator.of(context).pushNamed(AppRoutes.profilePageRoute);
          },
        ),
        centerTitle: true,
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCalendarPic,
              margin: EdgeInsets.only(right: 20),
              onTap: () {
                buildCalendar(context);
              })
        ]);
  }

  buildCalendar(BuildContext context) {
    DateTime dateTime;
    // make sure month/year in calendar stay updated
    if (initialDateTimeChanged) {
      dateTime = currentDateTime;
      print("dateTime is $dateTime");
    } else {
      dateTime = DateTime.now();
    }
    // curDayOfWeekFullName = getDayOfWeekFullName(dateTime);
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: CupertinoDatePicker(
                backgroundColor: Colors.white,
                initialDateTime: dateTime,
                onDateTimeChanged: (DateTime newTime) {
                  // dateTime = newTime;
                  initialDateTimeChanged = true;
                  setState(() {
                    currentDateTime = newTime;

                    // update current dayOfWeek full name
                    curDayOfWeekFullName =
                        getDayOfWeekFullName(currentDateTime);

                    currentMonthList =
                        date_util.DateUtils.daysInMonth(currentDateTime);
                    // Make sure to remove duplicates and sort if necessary, like in initState
                    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
                  });
                },
                use24hFormat: true,
                mode: CupertinoDatePickerMode.date,
              ),
            ));
  }
}
