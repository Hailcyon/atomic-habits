import 'package:ahapp3/model/habit.dart';
import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:ahapp3/core/app_export.dart';
import 'package:day_picker/day_picker.dart';

class CustomHabitPage extends StatefulWidget {
  CustomHabitPage({Key? key}) : super(key: key);

  @override
  State<CustomHabitPage> createState() => _CustomHabitPageState();
}

class _CustomHabitPageState extends State<CustomHabitPage> {
  final List<DayInWeek> _days = [
    DayInWeek("Mo", dayKey: "monday"),
    DayInWeek("Tu", dayKey: "tuesday"),
    DayInWeek("We", dayKey: "wednesday"),
    DayInWeek("Th", dayKey: "thursday"),
    DayInWeek("Fr", dayKey: "friday"),
    DayInWeek("Sa", dayKey: "saturday"),
    DayInWeek("Su", dayKey: "sunday"),
  ];

  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  final DatabaseService dbService = DatabaseService(
      uid: FirebaseAuth.instance.currentUser?.uid ??
          ''); // Initialize dbService with the user's UID;
  String habitId = "";

  TextEditingController _habitNameController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final argDayOfWeek = ModalRoute.of(context)!.settings.arguments as String;
    habitId = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    _habitNameController = TextEditingController(text: habitId);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            // padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // _entryField('Habit Name', TextEditingController()),
                _entryField('Habit Name', _habitNameController),
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
                _addPlace(context),
                SizedBox(height: 40.v),
                _saveButton(),
              ],
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
    final _startHours = _startTime.hour.toString().padLeft(2, '0');
    final _startMinutes = _startTime.minute.toString().padLeft(2, '0');
    final _endHours = _endTime.hour.toString().padLeft(2, '0');
    final _endMinutes = _endTime.minute.toString().padLeft(2, '0');
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // "Starts:" Section
          Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Starts: ', style: TextStyle(fontSize: 16)),
            ElevatedButton(
                child: Text(
                  '${_startHours}:${_startMinutes}',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
                onPressed: () async {
                  TimeOfDay? _newStartTime = await showTimePicker(
                    context: context,
                    initialTime: _startTime,
                  );
                  //if 'CANCEL' in timepicker => null
                  if (_newStartTime == null) return;
                  //if 'OK' in timepicker => update _endTime
                  setState(() => _startTime = _newStartTime);
                }),
          ])),
          // "Ends:" Section
          Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Ends: ', style: TextStyle(fontSize: 16)),
            ElevatedButton(
                child: Text(
                  '${_endHours}:${_endMinutes}',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
                onPressed: () async {
                  TimeOfDay? _newEndTime = await showTimePicker(
                    context: context,
                    initialTime: _endTime,
                  );
                  //if 'CANCEL' in timepicker => null
                  if (_newEndTime == null) return;

                  // Validation for end time being later than start time
                  if (_newEndTime.hour < _startTime.hour ||
                      (_newEndTime.hour == _startTime.hour &&
                          _newEndTime.minute <= _startTime.minute)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("End time must be later than start time.")),
                    );
                    return; // Prevent state update if validation fails
                  } else {
                    // //if 'OK' in timepicker => update _startTime
                    setState(() => _endTime = _newEndTime);
                  }
                }),
          ]))
        ]);
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

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  void _saveHabit(BuildContext context) {
    final String habitName = _habitNameController.text;
    final List<String> selectedDays =
        _days.where((day) => day.isSelected).map((day) => day.dayKey).toList();
    final String place = _placeController.text;

    if (habitName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Habit name is empty.")),
      );
    } else if (selectedDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Days is empty.")),
      );
    } else if (_endTime.hour < _startTime.hour ||
        (_endTime.hour == _startTime.hour &&
            _endTime.minute <= _startTime.minute)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("End time must be later than start time.")),
      );
    } else {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final String uid = auth.currentUser?.uid ?? '';

      // // Save the habit with start and end times to Firestore
      // // Before changing the habit id to habitx
      // dbService.saveHabit(habitName, selectedDays, _startTime!, _endTime!, place);

      // dbService.saveHabit(habitName, selectedDays, _startTime, _endTime, place)
      //   .then((String newHabitId) {
      //       // Use the newHabitId if needed
      //       // Navigator.of(context).pop(); // Go back or update UI
      //   })
      //   .catchError((error) {
      //     print('Error saving habit: $error');
      //       // Handle errors
      //       ScaffoldMessenger.of(context).showSnackBar(
      //           SnackBar(content: Text("Failed to save habit: $error"))
      //       );
      //   });

      // Create a new Habit object without ID first
      Habit newHabit = Habit(
        id: '', // Temporarily empty, will be filled by Firestore's generated ID
        name: habitName,
        days: selectedDays,
        startTime: _startTime,
        endTime: _endTime,
        place: place,
      );

      // Save the habit and update the ID with the one generated by Firestore
      dbService
          .saveHabit(newHabit.name, newHabit.days, newHabit.startTime,
              newHabit.endTime, newHabit.place)
          .then((String newHabitId) {
        // Update the habit's ID with the new one generated by Firestore
        newHabit = Habit(
          id: newHabitId, // Update with the generated ID
          name: newHabit.name,
          days: newHabit.days,
          startTime: newHabit.startTime,
          endTime: newHabit.endTime,
          place: newHabit.place,
        );

        // Here, you can now use newHabit with the complete data including its Firestore ID
        // Navigator.of(context).pop();  // Optionally, go back or update UI
      }).catchError((error) {
        print('Error saving habit: $error');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to save habit: $error")));
      });

      Navigator.of(context).pop(); // Optionally pop back after saving
    }
  }
}
