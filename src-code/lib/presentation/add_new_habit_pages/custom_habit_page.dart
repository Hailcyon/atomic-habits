import 'dart:ffi' hide Size;
// import 'dart:ui';

import 'package:ahapp3/model/habit.dart';
import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:ahapp3/core/app_export.dart';
import 'package:day_picker/day_picker.dart';
import 'package:ahapp3/service/notification_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ahapp3/presentation/home_page_container_page/home_page_container_page.dart';

// import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class CustomHabitPage extends StatefulWidget {
  CustomHabitPage({Key? key}) : super(key: key);

  @override
  State<CustomHabitPage> createState() => _CustomHabitPageState();
}

class _CustomHabitPageState extends State<CustomHabitPage> {
  final List<String> allIcons = [
    ImageConstant.shoppingCart,
    ImageConstant.book,
    ImageConstant.dinner,
    ImageConstant.eat,
    ImageConstant.eye,
    ImageConstant.fitness,
    ImageConstant.idea,
    ImageConstant.phone,
    ImageConstant.rowing,
    ImageConstant.run,
    ImageConstant.savings,
    ImageConstant.school,
    ImageConstant.table_view,
    ImageConstant.time
  ];

  String _defaultIconPath = ImageConstant.question_mark;
  String? selectedIconPath;

  Future<String?> showIconPicker(
      {required BuildContext context, String? defaultIconPath}) async {
    selectedIconPath = null;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Pick an Icon"),
        content: Container(
          height: 320,
          width: 400,
          alignment: Alignment.center,
          child: GridView.builder(
            itemCount: allIcons.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                selectedIconPath = allIcons[index];
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(allIcons[index], height: 50, width: 50),
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
    return selectedIconPath;
  }

  final List<DayInWeek> _days = [
    DayInWeek("Mo", dayKey: "monday"),
    DayInWeek("Tu", dayKey: "tuesday"),
    DayInWeek("We", dayKey: "wednesday"),
    DayInWeek("Th", dayKey: "thursday"),
    DayInWeek("Fr", dayKey: "friday"),
    DayInWeek("Sa", dayKey: "saturday"),
    DayInWeek("Su", dayKey: "sunday"),
  ];

  String _startTime = '--:--';
  String _endTime = '--:--';

  final DatabaseService dbService = DatabaseService(
      uid: FirebaseAuth.instance.currentUser?.uid ??
          ''); // Initialize dbService with the user's UID;
  String habitId = "";
  NotificationService notificationService = new NotificationService();
  TextEditingController _habitNameController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    habitId = '';
    _habitNameController = TextEditingController(text: habitId);
  }

  @override
  Widget build(BuildContext context) {
    // final argDayOfWeek = ModalRoute.of(context)!.settings.arguments as String;
    habitId = ModalRoute.of(context)?.settings.arguments as String? ??
        ''; //habit name will be blank w/out arg
    _habitNameController = TextEditingController(
        text: habitId); //autofill with suggested habit clicked

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            // padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // _entryField('Habit Name', TextEditingController()),
                  _entryField(context, 'Habit Name', _habitNameController),
                  SizedBox(height: 40.v),
                  SelectWeekDays(
                    days: _days,
                    onSelect: (values) {},
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        // 10% of the width, so there are ten blinds.
                        colors: [
                          Color.fromARGB(255, 243, 220, 115),
                          Color.fromARGB(255, 226, 192, 41),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.v),
                  _addTime(context),
                  SizedBox(height: 40.v),
                  _resetTimeButton(),
                  SizedBox(height: 40.v),
                  _addPlace(context),
                  SizedBox(height: 40.v),
                  _saveButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Add a New Habit'),
      //leading: Icon(Icons.arrow_back_ios),
    );
  }

  Widget _addPlace(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Place: ',
          style: TextStyle(
            fontSize:
                16, // Optional: Adjust the font size according to your design
          ),
        ),
        Expanded(
          // Wrap TextField in Expanded to ensure it takes the remaining space
          child: TextField(
            controller:
                _placeController, // Use the TextEditingController for place
            decoration: InputDecoration(
              hintText: 'Place to perform habit action',
            ),
          ),
        ),
      ],
    );
  }

  Widget _addTime(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Starts: ', style: TextStyle(fontSize: 16)),
            ElevatedButton(
              child: Text(_startTime == '--:--' ? '--:--' : _startTime),
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    _startTime =
                        '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
                  });
                }
              },
            ),
          ]),
        ),
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Ends: ', style: TextStyle(fontSize: 16)),
            ElevatedButton(
              child: Text(_endTime == '--:--' ? '--:--' : _endTime),
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    _endTime =
                        '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
                  });
                }
              },
            ),
          ]),
        )
      ],
    );
  }

// Add the Reset Time button
  Widget _resetTimeButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _startTime = '--:--';
          _endTime = '--:--';
        });
      },
      child: Text('Reset Time'),
    );
  }

  Widget _saveButton() {
    return ElevatedButton(
      onPressed: () {
        _saveHabit(context);
      },
      child: Text(
        'Save',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white, // Set text color here
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 1, 82, 148),
        fixedSize: Size(150, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Larger corner radius
        ),
      ),
    );
  }

  Future<void> _iconPicker(BuildContext context) async {
    try {
      String? newIconPath = await showIconPicker(
          context: context, defaultIconPath: selectedIconPath);
      if (newIconPath != null) {
        setState(() {
          _defaultIconPath =
              newIconPath; // replace with currently selected icon
        });
      }
    } catch (e) {
      print("Icon picker error: $e");
    }
  }

  Widget _entryField(
      BuildContext context, String title, TextEditingController controller) {
    return Row(
      children: <Widget>[
        // button with icon on it
        ElevatedButton(
          // style: ElevatedButton.styleFrom(
          //   primary: Colors.white,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   padding: EdgeInsets.zero,
          // ),
          onPressed: () => _iconPicker(context), // show icon picker
          child: Container(
            padding: EdgeInsets.all(8), // padding around icon
            child: SvgPicture.asset(
              _defaultIconPath, // default question mark icon
              width: 24, // set icon width
              height: 24, // set icon height
              color: Colors.black, // icon color
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: title,
            ),
          ),
        ),
      ],
    );
  }

  void _saveHabit(BuildContext context) async {
    final String habitName = _habitNameController.text;
    final List<String> selectedDays =
        _days.where((day) => day.isSelected).map((day) => day.dayKey).toList();
    final String place = _placeController.text;
    // 获取和格式化当前日期
    String createDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Convert the time displayed as "--:--" to an empty string
    final String startTimeToSave = _startTime != '--:--' ? _startTime : '';
    final String endTimeToSave = _endTime != '--:--' ? _endTime : '';

    if (habitName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Habit name is empty.")),
      );
    } else if (selectedDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Days is empty.")),
      );
    } else {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final String uid = auth.currentUser?.uid ?? '';

      // can't save if end time is set without a start time
      if (_startTime == '--:--' && _endTime != '--:--') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Cannot set end time without start time.")));
        return;
      }

      // if both start/end time are set, make sure end is later than start
      if (_startTime != '--:--' && _endTime != '--:--') {
        final List<String> startTimeParts = _startTime.split(':');
        final List<String> endTimeParts = _endTime.split(':');
        final TimeOfDay startTOD = TimeOfDay(
            hour: int.parse(startTimeParts[0]),
            minute: int.parse(startTimeParts[1]));
        final TimeOfDay endTOD = TimeOfDay(
            hour: int.parse(endTimeParts[0]),
            minute: int.parse(endTimeParts[1]));

        if (endTOD.hour < startTOD.hour ||
            (endTOD.hour == startTOD.hour &&
                endTOD.minute <= startTOD.minute)) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("End time must be later than start time.")));
          return;
        }
      }

      if (selectedIconPath == null) {
        selectedIconPath =
            "assets/images/circle.svg"; // default habit icon if not customized
      }

      print("IM IN HERE");
      final int habitsCount = await getUserHabitsCount();
      print(habitsCount);
      if (habitsCount == 0) {
        print("CHANGING");
        HomePageContainerPage.addedFirstHabit = true;
      }

      dbService
          .saveHabit(habitName, selectedDays, startTimeToSave, endTimeToSave,
              place, selectedIconPath!, createDate)
          .then((String newHabitId) {
             //going to add in the notification creation here
        notificationService.repeatingNotification(
            newHabitId.hashCode,
            newHabit.name,
            newHabit.place,
            DateTime.now(),
            newHabit.startTime,
            "",
            List<DayInWeek>.from(newHabit
                .days)); //casting here shouldn't be an issue since dayinweek is just a string type
          })
          .catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to save habit: $error")));
      });

      Navigator.of(context).pop(); // Optionally pop back after saving
      Navigator.of(context).pushNamed(AppRoutes.homePageRoute);
    }
  }
  
  Future<int> getUserHabitsCount() async {
    try {
      int count = await dbService.getUserHabitsCount();
      return count;
    } catch (error) {
      print('Error fetching user habits count: $error');
      throw error;
    }
  }
}
