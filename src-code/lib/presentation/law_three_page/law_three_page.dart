import 'package:ahapp3/presentation/law_three_page/reduce_friction_page.dart';
import 'package:ahapp3/presentation/law_three_page/habit_automation_page.dart';
import 'package:ahapp3/presentation/law_three_page/two_min_rule_page.dart';
import 'package:ahapp3/presentation/law_three_page/env_priming_page.dart';
import 'package:flutter/material.dart';

class LawThreePage extends StatefulWidget {
  final String habitId;
  final String habitName;
  const LawThreePage({Key? key, required this.habitId, required this.habitName})
      : super(key: key);

  @override
  State<LawThreePage> createState() => _LawThreePageState();
}

class _LawThreePageState extends State<LawThreePage> {
  String frictionResult = "";

  void updateFrictionText(String newText) {
    setState(() {
      frictionResult = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make It Easy', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 1, 82, 148),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _buildHabitLaw(context, "Reduce Friction",
                "Minimize obstacles to make starting habits effortless.", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ReduceFrictionPage(
                  onSave: updateFrictionText,
                  habitId: widget.habitId,
                  habitName: widget.habitName,
                ),
              ));
            }),
            _buildHabitLaw(context, "Two Minute Rule",
                "Begin habits with tasks taking two minutes or less.", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TwoMinPage(
                  onSave: updateFrictionText,
                  habitId: widget.habitId,
                  habitName: widget.habitName,
                ),
              ));
            }),
            _buildHabitLaw(context, "Habit Automation",
                "Use technology and routines to automate habits.", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HabAutoPage(
                  onSave: updateFrictionText,
                  habitId: widget.habitId,
                  habitName: widget.habitName,
                ),
              ));
            }),
            _buildHabitLaw(context, "Environment Priming",
                "Shape surroundings to make desired habits easier.", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EnvPrimingPage(
                  onSave: updateFrictionText,
                  habitId: widget.habitId,
                  habitName: widget.habitName,
                ),
              ));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildHabitLaw(BuildContext context, String buttonText,
      String buttonDescription, VoidCallback onPressed) {
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
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
                right: 0.0,
                left: 0.0), // Right padding to match childrenPadding
            child: frictionResult.isNotEmpty
                ? Text(
                    frictionResult) // Display the frictionResult text if it's not empty
                : Text(buttonDescription),
          ),
        ),
        SizedBox(height: 16.0), // Add some space
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
                      BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
      tilePadding: EdgeInsets.symmetric(horizontal: 16),
      childrenPadding: EdgeInsets.only(left: 16.0),
    );
  }
}
