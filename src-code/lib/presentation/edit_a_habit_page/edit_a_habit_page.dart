import 'package:ahapp3/routes/app_routes.dart';
import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ahapp3/core/app_export.dart';

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

  bool habitLawDetailsFetched = false;
  List<String> mio = [];
  List<String> mia = [];
  List<String> mie = [];
  List<String> mis = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habitName, style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 1, 82, 148),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
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
      tilePadding: EdgeInsets.symmetric(horizontal: 16),
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
                child: Text(buttonText, style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 248, 213, 17), // Button color
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
