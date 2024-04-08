import 'package:ahapp3/core/utils/size_utils.dart';
import 'package:ahapp3/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ahapp3/service/database.dart';

class HabSta extends StatefulWidget {
  // const ReduceFrictionPage({Key? key}) : super(key: key);
  final Function(String) onSave;

  final String habitId;

  const HabSta({Key? key, required this.onSave, required this.habitId})
      : super(key: key);

  @override
  State<HabSta> createState() => _HabSta();
}

class _HabSta extends State<HabSta> {
  final userInputController = TextEditingController();
  List<Widget> additionalInputs = [];
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
          'Habit Stacking',
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _reduceFrictionDetail(context),
            SizedBox(height: 50.0),
            //_reduceFrictionSugguestion(context),
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
                        decoration: InputDecoration(
                          hintText: '',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                );
              });
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

  // Widget addThenText(BuildContext context){
  //   return (
  //     Text(
  //         "Then, I will:",
  //         style: TextStyle(
  //           fontSize: 20.0,
  //         ),
  //     )
  //   );

  // }

  // Widget addHabitInput(BuildContext context){
  //   return (
  //     TextField(
  //         controller: userInputController,
  //         decoration: InputDecoration(
  //           hintText: '',
  //           border: OutlineInputBorder(),
  //           suffixIcon: IconButton(
  //             onPressed: () {
  //               userInputController.clear();
  //             },
  //             icon: Icon(Icons.clear),
  //           ),
  //         ),
  //       ),
  //   );
  // }

  // Widget addHabitButton(BuildContext context){
  //   return (
  //     MaterialButton(
  //           onPressed: () {
  //             addThenText(context);
  //             //addHabitInput()
  //           },
  //           color: Color.fromARGB(255, 1, 82, 148),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(5),
  //           ),
  //           padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
  //           child: Text(
  //             '+',
  //             style: TextStyle(
  //               color: Color.fromARGB(255, 246, 240, 230),
  //               // fontSize: 20,
  //             ),
  //           ),
  //         )
  //   );
  // }

  // Widget _reduceFrictionSugguestion(BuildContext context){
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //         padding: EdgeInsets.only(bottom:0), // Space between the label and the first suggestion
  //         child: Text(
  //           "Suggestions:", // The label text
  //           style: TextStyle(
  //             color: Colors.black, // Color of the label
  //             fontSize: 20, // Size of the label text
  //             // fontWeight: FontWeight.bold, // Bold text for the label
  //           ),
  //         ),
  //       ),
  //       ...suggestions.map((suggestion) => InkWell(
  //         onTap: () {
  //           setState(() {
  //             userInputController.text = suggestion;
  //           });
  //         },
  //         child: Container(
  //           margin: EdgeInsets.only(top: 20),
  //           padding: EdgeInsets.all(10),
  //           color: Color.fromARGB(255, 237, 207, 116),
  //           child: Text(
  //             suggestion,
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 16,
  //             ),
  //             // softWrap: true, // Allow text wrapping
  //             // overflow: TextOverflow.visible, // Show all text
  //           ),
  //         ),
  //       )).toList(),
  //       ],
  //     ),
  //   );
  // }

  void saveHabitLaw(BuildContext context, String habitStr) async {
    //TODO fix so multiple can be added with array
    //habitNum = habit law (1 2 3 or 4)
    final int habitNum = 1;

    //habitLawNum = name of habit law
    final String habitLawNum = "Habit Stack";

    if (habitStr.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Input is empty.")),
      );
    } else {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final String uid = auth.currentUser?.uid ?? '';

      //habitStr Should be input controller.text
      String fin_habitStr = "Habit Stack:\n" + habitStr;

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
