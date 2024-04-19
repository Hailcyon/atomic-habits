import 'package:ahapp3/service/database.dart';
import 'package:intl/intl.dart';

import 'bloc/home_page_container_bloc.dart';

import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahapp3/presentation/auth.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ahapp3/utils/date_utils.dart' as date_util;

import 'package:flutter_svg/flutter_svg.dart';

class HomePageContainerPage extends StatefulWidget {
  HomePageContainerPage({Key? key}) : super(key: key);
  static bool isNewUser = false;
  static bool addedFirstHabit = false;

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

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (HomePageContainerPage.isNewUser) {
        _showWelcomeDialog(context);
      }
      if (HomePageContainerPage.addedFirstHabit) {
        _showHabitHelpDialog(context);
      }
    });
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

  // the blue box to show days
  Widget topView() {
    return Container(
      height: height * 0.13,
      width: width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 1, 82, 148),
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
                  colors: !isSelected
                      ? [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0.6)
                        ]
                      : [
                          Color.fromARGB(255, 131, 194, 60),
                          Color.fromARGB(255, 131, 194, 60),
                          Color.fromARGB(255, 131, 194, 60)
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

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(children: <Widget>[
        SizedBox(height: 10),
        topView(),
        SizedBox(height: 20),
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
                      final habitName = habit['name']; // Extract the habit name
                      final iconPath =
                          habit['iconPath']; // Extract the icon path
                      // Add the habit button
                      habitWidgets.add(buildHabitButton(
                        context: context,
                        habitId: habitId, // Pass the habit ID
                        habitName: habitName!,
                        leftIconPath: iconPath!,
                      ));

                      // Add spacing after the button, but not after the last one
                      if (index < snapshot.data!.length - 1) {
                        habitWidgets.add(SizedBox(
                            height:
                                20)); // Adjust the height for desired spacing
                      }
                    });

                    // Return a Column of habit buttons
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
        selectedItemColor: Color.fromARGB(255, 1, 82, 148),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          if (index == 1) {
            Navigator.of(context).pushNamed(AppRoutes.newHabitPageRoute);
          } else if (index == 2) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.statisticsPageRoute, (route) => false);
          } else {}
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
    required String leftIconPath,
  }) {
    // set color based on the chosen date habit skipped status
    String currentDateStr = DateFormat('yyyy-MM-dd').format(currentDateTime);
    String habitDateKey = '${habitId}_$currentDateStr';
    Color buttonColor = skippedHabits[habitDateKey] ?? false
        ? Color.fromARGB(255, 248, 213, 17).withOpacity(0.2)
        : Color.fromARGB(255, 248, 213, 17);

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
                          Navigator.of(context).pop();
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
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                    elevation: 24,
                  ),
                );
              }),
              backgroundColor: Colors.red,
              icon: Icons.arrow_forward,
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
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 6.0), // Padding inside the button
              alignment: Alignment.centerLeft, // Align the content to the left
              elevation: 5,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.editHabitPageRoute,
                  arguments: {habitId, habitName});
            },
            child: Row(
              mainAxisSize: MainAxisSize.min, // Use the minimum space
              children: [
                SvgPicture.asset(
                  leftIconPath,
                  width: 24,
                  height: 24,
                  color: Colors.black,
                ),
                SizedBox(
                    width: 15), // Add spacing between the icon and the text
                Expanded(
                  child: Text(
                    habitName,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showWelcomeDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Welcome to Atomic Habits: The App'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Begin by adding a new habit at the middle of the bottom navigation bar.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Dismiss the dialog and set isNewUser to false
                setState(() {
                  HomePageContainerPage.isNewUser = false;
                });
                Navigator.of(context).pop();
              },
              child: Text('Start'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showHabitHelpDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your First Habit has been added!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Swipe right on the habit to complete it\n\nSwipe left on the habit to skip it\n\nClick the habit to add habit laws'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Dismiss the dialog and set isNewUser to false
                setState(() {
                  HomePageContainerPage.addedFirstHabit = false;
                });
                Navigator.of(context).pop();
              },
              child: Text('Get Started'),
            ),
          ],
        );
      },
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
                      Navigator.of(context).pop();
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

  Future<int> getStreak(habitId, DateTime chosenDateTime) async {
    return await dbService.updateStreak(habitId, chosenDateTime);
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title:
            Text('Habits', style: TextStyle(color: Colors.black, fontSize: 25)),
        height: 70.v,
        leadingWidth: 100.h,
        leading: IconButton(
          icon: Icon(Icons.settings, size: 40, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.settingsPageRoute);
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
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: CupertinoDatePicker(
                backgroundColor: Colors.white,
                initialDateTime: dateTime,
                onDateTimeChanged: (DateTime newTime) {
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
