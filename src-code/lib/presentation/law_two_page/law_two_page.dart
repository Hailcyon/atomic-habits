import 'package:ahapp3/presentation/law_two_page/moti_ritual.dart';
import 'package:ahapp3/presentation/law_two_page/tempt_bundle.dart';
import 'package:flutter/material.dart';

class LawTwoPage extends StatefulWidget {
  final String habitId;
  final String habitName;

  const LawTwoPage({Key? key, required this.habitId, required this.habitName})
      : super(key: key);

  @override
  State<LawTwoPage> createState() => _LawTwoPage();
}

class _LawTwoPage extends State<LawTwoPage> {
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
        title:
            Text('Make It Attractive', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 1, 82, 148),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _buildHabitLaw(context, "Temptation Bundling",
                "Combining a desired activity with a necessary one to make the latter more appealing.",
                () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TemptBundle(
                  onSave: updateFrictionText,
                  habitId: widget.habitId,
                  habitName: widget.habitName,
                ),
              ));
            }),
            _buildHabitLaw(context, "Motivation Ritual",
                "A pre-habit enjoyable routine designed to increase motivation for a challenging task.",
                () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MotiRitual(
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
        SizedBox(height: 16.0),
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
                  borderRadius: BorderRadius.circular(5),
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
