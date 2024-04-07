import 'package:ahapp3/core/utils/size_utils.dart';
import 'package:ahapp3/presentation/law_one_page/imp_int.dart';
import 'package:ahapp3/presentation/law_one_page/hab_sta.dart';
import 'package:ahapp3/presentation/law_one_page/env_des.dart';
import 'package:ahapp3/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LawOnePage extends StatefulWidget {
  final String habitId;
  final String habitName;
  const LawOnePage({Key? key, required this.habitId, required this.habitName})
      : super(key: key);

  @override
  State<LawOnePage> createState() => _LawOnePage();
}

class _LawOnePage extends State<LawOnePage> {
  String frictionResult = "";

  void updateFrictionText(String newText) {
    setState(() {
      frictionResult = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the habitName passed as an argument
    // final String _habitId =
    //     ModalRoute.of(context)?.settings.arguments as String? ??
    //         'Default Habit Name';

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Make It Obvious')),
      body: Container(
        //color: Color.fromARGB(255, 246, 240, 230),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _buildHabitLaw(context, "Implementation Intention",
                "Edit your habit for effective habit planning.", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ImpInt(
                  onSave: updateFrictionText,
                  habitId: widget.habitId,
                ),
              ));
            }),
            _buildHabitLaw(context, "Habit Stacking",
                "Combine new habits with existing routines for simplicity.",
                () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HabSta(
                  onSave: updateFrictionText,
                  habitId: widget.habitId,
                ),
              ));
            }),
            _buildHabitLaw(context, "Environment Design",
                "Arrange surroundings to make habits visible and easy.", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EnvDes(
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
            //Text('Reduce friction explained xxxxxxxx xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj.'),
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
}
