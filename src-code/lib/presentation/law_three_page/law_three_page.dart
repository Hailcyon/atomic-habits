import 'package:ahapp3/core/utils/size_utils.dart';
import 'package:ahapp3/presentation/law_three_page/reduce_friction_page.dart';
import 'package:ahapp3/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LawThreePage extends StatefulWidget {
  const LawThreePage({Key? key}) : super(key: key);

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
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Make It Easy')
      ),
      body: Container(
        //color: Color.fromARGB(255, 246, 240, 230),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _buildReduceFriction(context),
            _buildTwoMinute(context),
            _buildHabitAuto(context),
            _buildEnvPriming(context),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildReduceFriction(BuildContext context,) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Reduce Friction",
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
            padding: EdgeInsets.only(right: 0.0, left: 0.0),  // Right padding to match childrenPadding
            child: frictionResult.isNotEmpty 
            ? Text(frictionResult) // Display the frictionResult text if it's not empty
            : Text('Reduce friction explained xxxxxxxx...'), 
            //Text('Reduce friction explained xxxxxxxx xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj.'),
          ),
        ),
        SizedBox(height: 16.0), // Add some space
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0),  // Right padding to match childrenPadding
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigator.of(context).pushNamed(AppRoutes.reduceFrictionRoute);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReduceFrictionPage(
                    onSave: updateFrictionText,
                  ),
                ));
              },
              icon: Icon(
                Icons.add,
                color: Color.fromARGB(255, 246, 240, 230),
              ),
              label: Text(""),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 82, 148),
                fixedSize: Size(500, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Larger corner radius
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

  Widget _buildTwoMinute(BuildContext context,) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Two Minute Rule",
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
            padding: EdgeInsets.only(right: 0.0, left: 0.0),  // Right padding to match childrenPadding
            child: Text('Two minute Rule explained xxxxxxxx xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj.'),
          ),
        ),
        SizedBox(height: 16.0), // Add some space
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0),  // Right padding to match childrenPadding
            child: ElevatedButton.icon(
              onPressed: () {
                // Button action
              },
              icon: Icon(
                Icons.add,
                color: Color.fromARGB(255, 246, 240, 230),
              ),
              label: Text(""),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 82, 148),
                fixedSize: Size(500, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Larger corner radius
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

  Widget _buildHabitAuto(BuildContext context,) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Habit Automation",
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
            padding: EdgeInsets.only(right: 0.0, left: 0.0),  // Right padding to match childrenPadding
            child: Text('Habit Automation explained xxxxxxxx xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj.'),
          ),
        ),
        SizedBox(height: 16.0), // Add some space
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0),  // Right padding to match childrenPadding
            child: ElevatedButton.icon(
              onPressed: () {
                // Button action
              },
              icon: Icon(
                Icons.add,
                color: Color.fromARGB(255, 246, 240, 230),
              ),
              label: Text(""),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 82, 148),
                fixedSize: Size(500, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Larger corner radius
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

  Widget _buildEnvPriming(BuildContext context,) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Environment Priming",
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
            padding: EdgeInsets.only(right: 0.0, left: 0.0),  // Right padding to match childrenPadding
            child: Text('Environment Priming explained xxxxxxxx xxxxdskjfh skdhfksd hfkhsdkuhdmfchbsdkj.'),
          ),
        ),
        SizedBox(height: 16.0), // Add some space
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0),  // Right padding to match childrenPadding
            child: ElevatedButton.icon(
              onPressed: () {
                // Button action
              },
              icon: Icon(
                Icons.add,
                color: Color.fromARGB(255, 246, 240, 230),
              ),
              label: Text(""),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 82, 148),
                fixedSize: Size(500, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Larger corner radius
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
