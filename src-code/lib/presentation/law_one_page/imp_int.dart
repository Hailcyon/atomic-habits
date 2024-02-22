import 'package:ahapp3/core/utils/size_utils.dart';
import 'package:ahapp3/routes/app_routes.dart';
import 'package:ahapp3/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ImpInt extends StatefulWidget {
  // const ReduceFrictionPage({Key? key}) : super(key: key);
  final Function(String) onSave;

  //use to get specific habit in database
  final String habitId;

  const ImpInt({Key? key, required this.onSave, required this.habitId}) : super(key: key);

  @override
  State<ImpInt> createState() => _ImpInt();
}

class _ImpInt extends State<ImpInt> {
  final userInputController = TextEditingController();
  final List<String> suggestions = [
    "Suggestion 1: ..."
  ];

  final DatabaseService dbService = DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid ?? ''); // Initialize dbService with the user's UID;
  final whatHabitController = TextEditingController();
  final whatDayController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final whereHabitController = TextEditingController();
  String _habitName = "";
  String _startTime = "";
  String _endTime = "";
  String _place = "";
  List<String> _days = [];

  @override
  void initState() {
    super.initState();
    getHabitDetails();  // Example usage: fetching data from a database.
  }

  void getHabitDetails() async {
    try {
      DocumentSnapshot habitDoc = await dbService.getHabitDetails(widget.habitId);
      if (habitDoc.exists) {
        Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;
        _habitName = habitDoc['name'];
        _startTime = habitDoc['start time'].toString();
        _endTime = habitDoc['end time'].toString();
        _place = habitDoc['place'];
        _days = List<String>.from(data['days'] ?? []);
        setState(() {
          whatHabitController.text = _habitName;
          // whatDayController.text = _
          startTimeController.text = _startTime;
          endTimeController.text = _endTime;
          whereHabitController.text = _place;
        });
        // _habitName = habitDoc['name'];
        // setState(() {
        //   whatHabitController.text = _habitName;
        // });
      }
    } catch (e) {
      print("Error fetching habit details: $e");
      // Optionally, handle the error e.g., show a message
    }
  }

  bool isValidTime(String time) {
    final RegExp timeRegExp = RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$');
    return timeRegExp.hasMatch(time);
  }

  bool isStartEndTimeValid(String startTime, String endTime) {
    if (!isValidTime(startTime) || !isValidTime(endTime)) return false;

    final format = DateFormat("HH:mm");
    final start = format.parse(startTime);
    final end = format.parse(endTime);

    return end.isAfter(start);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Implementation Intention',
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _editHabit(context),
            SizedBox(height: 50.0),
            _reduceFrictionSugguestion(context),
          ],
        ),
      ),
    );
  }

  Widget _editHabit(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What is your habit?",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: whatHabitController,
            decoration: InputDecoration(
              hintText: "Enter your habit",
              suffixIcon: IconButton(
                onPressed: () {
                  whatHabitController.clear();
                },
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "What day is your habit?",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: userInputController,
            decoration: InputDecoration(
              hintText: '',
              // border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  userInputController.clear();
                },
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "Start time of your habit?",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: startTimeController,
            decoration: InputDecoration(
              hintText: "Enter your habit start time",
              suffixIcon: IconButton(
                onPressed: () {
                  startTimeController.clear();
                },
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "End time of your habit?",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: endTimeController,
            decoration: InputDecoration(
              hintText: "Enter your habit end time",
              suffixIcon: IconButton(
                onPressed: () {
                  endTimeController.clear();
                },
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "Where is your habit?",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: userInputController,
            decoration: InputDecoration(
              hintText: '',
              suffixIcon: IconButton(
                onPressed: () {
                  userInputController.clear();
                },
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          //save button
          MaterialButton(
            onPressed: () {
              // habit name
              if (whatHabitController.text.isNotEmpty) {
                  dbService.updateHabitName(widget.habitId, whatHabitController.text)
                      .then((_) {
                          // Show a confirmation message or perform other actions on success
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Habit name updated successfully"))
                          );
                      })
                      .catchError((error) {
                          // Handle any errors here
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Failed to update habit name: $error"))
                          );
                      });
              } 
              // else {
              //     // Handle the case where the text field is empty
              //     ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(content: Text("Habit name cannot be empty"))
              //     );
              // }

              // Validate start and end times
              if (!isStartEndTimeValid(startTimeController.text, endTimeController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid time format or end time is not after start time")));
                return;
              }

              // start time
              if (startTimeController.text.isNotEmpty) {
                  dbService.updateStartTime(widget.habitId, startTimeController.text)
                      .then((_) {
                          // Show a confirmation message or perform other actions on success
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Habit start time updated successfully"))
                          );
                      })
                      .catchError((error) {
                          // Handle any errors here
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Failed to update habit start time: $error"))
                          );
                      });
              } 
              // end time
              if (endTimeController.text.isNotEmpty) {
                  dbService.updateEndTime(widget.habitId, endTimeController.text)
                      .then((_) {
                          // Show a confirmation message or perform other actions on success
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Habit end time updated successfully"))
                          );
                      })
                      .catchError((error) {
                          // Handle any errors here
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Failed to update habit end time: $error"))
                          );
                      });
              } 
            },
            color: Color.fromARGB(255, 1, 82, 148),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Text(
              'Save',
              style: TextStyle(
                color: Color.fromARGB(255, 246, 240, 230),
                // fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _reduceFrictionSugguestion(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
          padding: EdgeInsets.only(bottom:0), // Space between the label and the first suggestion
          child: Text(
            "Suggestions:", // The label text
            style: TextStyle(
              color: Colors.black, // Color of the label
              fontSize: 20, // Size of the label text
              // fontWeight: FontWeight.bold, // Bold text for the label
            ),
          ),
        ),
        ...suggestions.map((suggestion) => InkWell(
          onTap: () {
            setState(() {
              userInputController.text = suggestion;
            });
          },
          child: Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(10),
            color: Color.fromARGB(255, 237, 207, 116),
            child: Text(
              suggestion,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              // softWrap: true, // Allow text wrapping
              // overflow: TextOverflow.visible, // Show all text
            ),
          ),
        )).toList(),
        ],
      ),
    );
  }

}