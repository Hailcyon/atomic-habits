import 'dart:io';
import 'dart:convert';

import 'package:ahapp3/routes/app_routes.dart';
import 'package:ahapp3/core/utils/size_utils.dart';
import 'package:ahapp3/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';

import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_title.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';

class EditHabitPage extends StatefulWidget {
  final String habitId;
  final String habitName;
  const EditHabitPage(
      {Key? key, required this.habitId, required this.habitName})
      : super(key: key);

  @override
  State<EditHabitPage> createState() => _EditHabitPageState();
}

class _EditHabitPageState extends State<EditHabitPage> {
  final DatabaseService dbService =
      DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid ?? '');
  // String habitId = "";
  // Define variables for habit details
  String _habitName = "";
  String _startTime = "";
  String _endTime = "";
  String _place = "";

  List<String> _days = [];

  bool habitLawDetailsFetched = false;
  List<String> mio = [];
  List<String> mia = [];
  List<String> mie = [];
  List<String> mis = [];

  // @override
  // void initState() {
  //     super.initState();
  //     print("TEST");
  //     getHabitLawDetails();
  // }

  // void setHabitLawDetailsFetchedFalse(){
  //   habitLawDetailsFetched = false;
  // }

  //I dont think this method is actually used
  void getHabitDetails() async {
    //print("TEST")
    try {
      DocumentSnapshot habitDoc =
          await dbService.getHabitDetails(widget.habitId);
      if (habitDoc.exists) {
        // Assuming 'name' is the field where the habit's name is stored
        // habitName = habitDoc['name'];
        Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;
        setState(() {
          _habitName = habitDoc['name'];
          _startTime = habitDoc['start time'].toString();
          _endTime = habitDoc['end time'].toString();
          _place = habitDoc['place'];
          _days = List<String>.from(data['days'] ?? []);
        });
      }
    } catch (e) {
      print("Error fetching habit details: $e");
      // Optionally, handle the error e.g., show a message
    }
  }

  // void getHabitLawDetails() async {
  //   //print("TEST");
  //   try {
  //       QuerySnapshot habitLawDoc = await dbService.getHabitLawDetails(widget.habitId);
  //         habitLawDoc.docs.forEach((doc) {
  //           Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //           // Access other fields by their keys
  //           int habitNum = data['habitNum'];
  //           String habitLawNum = data['habitLawNum'];
  //           String habitlaw = data['habitLaw'];
  //           if (habitNum == 1) {
  //             mio.add(habitlaw);
  //           } else if (habitNum == 2) {
  //             mia.add(habitlaw);
  //           } else if (habitNum == 3) {
  //             mie.add(habitlaw);
  //           } else if (habitNum == 4) {
  //             mis.add(habitlaw);
  //           }
  //        });
  //     } catch (e) {
  //       print("Error fetching habit details: $e");
  //       // Optionally, handle the error e.g., show a message
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    // final habitId = ModalRoute.of(context)?.settings.arguments as String;

    //print(mio);

    // Retrieve the habit name passed as an argument
    // habitId = ModalRoute.of(context)?.settings.arguments as String? ?? 'Default Habit Name';
    // getHabitDetails();
    String impt_int_act =
        "Habit Action: $_habitName on ${_days.join(", ")} from $_startTime to $_endTime on $_place";

    // List<String> dummy_mio = [impt_int_act, "Put running shoes near the front door"];
    // // List<String> dummy_mio = ["Run at 7 AM at Liberty Park", "Put running shoes near the front door"]; //Make it obvious habit laws -> will retrieve from database
    // List<String> dummy_mia = ["Listen to educational audio-book while running."]; //make it attractive
    // List<String> dummy_mie = ["Lay out running clothes by bed."]; //make it easy
    // List<String> dummy_mis = ["Reward yourself after a 5 mile run."]; //make it satisfying

    //print("Test");

    // if (!habitLawDetailsFetched) {
    //   getHabitLawDetails();
    //   habitLawDetailsFetched = true;
    // }
    //print(mio);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Habit'),
      ),
      body: Center(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              StreamBuilder<List<Map<String, dynamic>>>(
                stream: dbService.getHabitLawDetailsStream(widget.habitId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (!snapshot.hasData) {
                    return Text("No habit laws found");
                  }
                  final mio = snapshot.data!
                      .where((law) => law['habitNum'] == 1)
                      .map((law) => law['habitLaw'] as String)
                      .toList();
                  final mia = snapshot.data!
                      .where((law) => law['habitNum'] == 2)
                      .map((law) => law['habitLaw'] as String)
                      .toList();
                  final mie = snapshot.data!
                      .where((law) => law['habitNum'] == 3)
                      .map((law) => law['habitLaw'] as String)
                      .toList();
                  final mis = snapshot.data!
                      .where((law) => law['habitNum'] == 4)
                      .map((law) => law['habitLaw'] as String)
                      .toList();
                  // Continue for mie and mis...

                  // Return widgets that display habit laws
                  return Column(
                    children: [
                      _buildLaw(
                          habitLaws: mio,
                          buttonText: "Make it Obvious",
                          context: context,
                          onPressed: () {
                            //getHabitDetails();
                            Navigator.of(context).pushNamed(
                              AppRoutes.lawOnePageRoute,
                              arguments: {widget.habitId, widget.habitName},
                            );
                          }),
                      _buildLaw(
                          habitLaws: mia,
                          buttonText: "Make it Attractive",
                          context: context,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.lawTwoPageRoute,
                              arguments: {widget.habitId, widget.habitName},
                            );
                          }),
                      _buildLaw(
                          habitLaws: mie,
                          buttonText: "Make it Easy",
                          context: context,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.lawThreePageRout,
                              arguments: {widget.habitId, widget.habitName},
                            );
                          }),
                      _buildLaw(
                          habitLaws: mis,
                          buttonText: "Make it Satisfying",
                          context: context,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.lawFourPageRoute,
                              arguments: {widget.habitId, widget.habitName},
                            );
                          }),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLaw(
      {required List habitLaws,
      required String buttonText,
      required BuildContext context,
      required VoidCallback onPressed}) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ],
      ),

      children: [
        // Map over habitLaws and convert each element to a buildHabitLaw widget
        // ...habitLaws.map((law) => buildHabitLaw(buttonText: law, context: context)),
        ...habitLaws.asMap().entries.expand((entry) {
          int idx = entry.key;
          String law = entry.value;
          return [
            buildHabitLaw(buttonText: law, context: context),
            if (idx < habitLaws.length - 1)
              SizedBox(
                  height: 8), // Add space after each button except the last one
          ];
        }).toList(),
        SizedBox(height: 8.0), // Add some space
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
                right: 16.0), // Right padding to match childrenPadding
            child: ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(
                Icons.add,
                color: Color.fromARGB(255, 246, 240, 230),
              ),
              label: Text(""),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 82, 148),
                fixedSize: Size(500, 20),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(5), // Larger corner radius
                ),
              ),
            ),
          ),
        ),
      ],
      // childrenPadding: EdgeInsets.all(100),
      tilePadding: EdgeInsets.symmetric(horizontal: 16),
      // expandedAlignment: Alignment.topLeft,
      childrenPadding: EdgeInsets.only(left: 16.0),
    );
  }

  Widget buildHabitLaw({
    required String buttonText,
    required BuildContext context,
  }) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
            right: 16), // Right padding to match childrenPadding
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(buttonText),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  alignment: Alignment.centerLeft, // Align the text to the left
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0), // Padding inside the button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
