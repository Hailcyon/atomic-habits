import 'package:ahapp3/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ahapp3/service/database.dart';

class TwoMinPage extends StatefulWidget {
  final Function(String) onSave;

  final String habitId;
  final String habitName;

  const TwoMinPage(
      {Key? key,
      required this.onSave,
      required this.habitId,
      required this.habitName})
      : super(key: key);

  @override
  State<TwoMinPage> createState() => _TwoMinPage();
}

class _TwoMinPage extends State<TwoMinPage> {
  final userInputController = TextEditingController();

  final DatabaseService dbService = DatabaseService(
      uid: FirebaseAuth.instance.currentUser?.uid ??
          ''); // Initialize dbService with the user's UID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Minute Rule', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 1, 82, 148),
        iconTheme: IconThemeData(
          color: Colors.white,
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
            "How can I minimize my habit into two minutes?",
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
                  widget.habitName, "MakeItEasy", "TwoMinuteRule"),
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
                      "Suggestions:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
    final int habitNum = 3;

    //habitLawNum = name of habit law
    final String habitLawNum = "Two Minute Rule";

    if (habitStr.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Input is empty.")),
      );
    } else {
      //habitStr Should be input controller.text
      String fin_habitStr = "Two Minute Rule:\n" + habitStr;

      // Save the habit and update the ID with the one generated by Firestore
      await dbService.saveHabitLaw(
          widget.habitId, habitNum, habitLawNum, fin_habitStr);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Habit law action has been added!")));

      Navigator.popUntil(
          context, ModalRoute.withName(AppRoutes.editHabitPageRoute));
    }
  }
}
