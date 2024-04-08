import 'package:ahapp3/core/utils/size_utils.dart';
import 'package:ahapp3/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ahapp3/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MotiRitual extends StatefulWidget {
  // const ReduceFrictionPage({Key? key}) : super(key: key);
  final Function(String) onSave;

  final String habitId;
  final String habitName;

  const MotiRitual(
      {Key? key,
      required this.onSave,
      required this.habitId,
      required this.habitName})
      : super(key: key);

  @override
  State<MotiRitual> createState() => _MotiRitual();
}

class _MotiRitual extends State<MotiRitual> {
  final userInputController = TextEditingController();
  // final List<String> suggestions = [
  //   "Suggestion 1:...",
  //   "Suggestion 2",
  //   "Suggestion 3",
  //   // Add more suggestions as needed
  // ];

  final DatabaseService dbService = DatabaseService(
      uid: FirebaseAuth.instance.currentUser?.uid ??
          ''); // Initialize dbService with the user's UID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Motivation Ritual',
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _reduceFrictionDetail(context),
            SizedBox(height: 50.0),
            generateSuggestions(context),
          ],
        ),
      ),
    );
  }

  Widget _reduceFrictionDetail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Text(
            "I will increase my motivation before this task by",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: userInputController,
            decoration: InputDecoration(
              hintText: '',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  userInputController.clear();
                },
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          MaterialButton(
            onPressed: () {
              saveHabitLaw(context, userInputController.text);
              //widget.onSave("I will make going for a run easier by ${userInputController.text}");
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

  Widget generateSuggestions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<List<String>>(
              stream: dbService.getSuggestedHabitLawActions(
                  widget.habitName, "MakeItAttractive", "MotivationRitual"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong: ${snapshot.error}");
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text(""); // Handle case where no data is available
                }
                List<Widget> suggestionWidgets = [];

                suggestionWidgets.add(
                  Padding(
                    padding: EdgeInsets.only(
                        bottom:
                            0), // Space between the label and the first suggestion
                    child: Text(
                      "Suggestions:", // The label text
                      style: TextStyle(
                        color: Colors.black, // Color of the label
                        fontSize: 20, // Size of the label text
                      ),
                    ),
                  ),
                );

                for (int index = 0; index < snapshot.data!.length; index++) {
                  final suggestion = snapshot.data![index];

                  // Add the suggestion button
                  suggestionWidgets.add(InkWell(
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
                      ),
                    ),
                  ));
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: suggestionWidgets,
                );
              }),
        ],
      ),
    );
  }

  void saveHabitLaw(BuildContext context, String habitStr) async {
    //habitNum = habit law (1 2 3 or 4)
    final int habitNum = 2;

    //habitLawNum = name of habit law
    final String habitLawNum = "Motivation Ritual";

    if (habitStr.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Input is empty.")),
      );
    } else {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final String uid = auth.currentUser?.uid ?? '';

      //habitStr Should be input controller.text
      String fin_habitStr = "Motivation Ritual:\n" + habitStr;

      // Save the habit and update the ID with the one generated by Firestore
      await dbService.saveHabitLaw(
          widget.habitId, habitNum, habitLawNum, fin_habitStr);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Habit law has been added!")));

      // Navigator.of(context).pushNamed(AppRoutes.editHabitPageRoute, arguments: widget.habitId);
      // Navigator.popUntil(context, ModalRoute.withName(AppRoutes.homePageRoute));
    }
  }
}
