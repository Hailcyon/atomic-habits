import 'package:ahapp3/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ahapp3/service/database.dart';

class HabSta extends StatefulWidget {
  final Function(String) onSave;

  final String habitId;

  const HabSta({Key? key, required this.onSave, required this.habitId})
      : super(key: key);

  @override
  State<HabSta> createState() => _HabSta();
}

class _HabSta extends State<HabSta> {
  final userInputController = TextEditingController();
  final input1 = TextEditingController();
  final input2 = TextEditingController();
  final input3 = TextEditingController();
  final input4 = TextEditingController();

  List<Widget> additionalInputs = [];
  List<TextEditingController> textControllers = [];

  final DatabaseService dbService = DatabaseService(
      uid: FirebaseAuth.instance.currentUser?.uid ??
          ''); // Initialize dbService with the user's UID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Stacking', style: TextStyle(color: Colors.white)),
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
          ],
        ),
      ),
    );
  }

  Widget _reduceFrictionDetail(BuildContext context) {
    String stackString = '';
    textControllers = [input1, input2, input3, input4];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Text(
            "First, I will:",
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
          ...additionalInputs,
          MaterialButton(
            onPressed: () {
              if (additionalInputs.length < 5) {
                if (additionalInputs.length != 0) {}
                setState(() {
                  additionalInputs.add(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Then, I will:",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          controller: textControllers[additionalInputs.length],
                          decoration: InputDecoration(
                            hintText: '',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                textControllers[additionalInputs.length]
                                    .clear();
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
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
              '+',
              style: TextStyle(
                color: Color.fromARGB(255, 246, 240, 230),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              stackString = userInputController.text;
              for (int i = 0; i < additionalInputs.length; i++) {
                stackString =
                    stackString + ",\nthen " + textControllers[i].text;
              }
              saveHabitLaw(context, stackString);
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

  void saveHabitLaw(BuildContext context, String habitStr) async {
    //habitNum = habit law (1 2 3 or 4)
    final int habitNum = 1;

    //habitLawNum = name of habit law
    final String habitLawNum = "Habit Stack";

    if (habitStr.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Input is empty.")),
      );
    } else {
      //habitStr Should be input controller.text
      String fin_habitStr = "Habit Stack:\n" + habitStr;

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
