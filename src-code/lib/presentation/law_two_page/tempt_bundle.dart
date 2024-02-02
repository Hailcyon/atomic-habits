import 'package:ahapp3/core/utils/size_utils.dart';
import 'package:ahapp3/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class TemptBundle extends StatefulWidget {
  // const ReduceFrictionPage({Key? key}) : super(key: key);
  final Function(String) onSave;

  const TemptBundle({Key? key, required this.onSave}) : super(key: key);


  @override
  State<TemptBundle> createState() => _TemptBundle();
}

class _TemptBundle extends State<TemptBundle> {
  final userInputController = TextEditingController();
  final List<String> suggestions = [
    "Suggestion 1:...",
    "Suggestion 2",
    "Suggestion 3",
    // Add more suggestions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Temptation Bundling',
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _reduceFrictionDetail(context),
            SizedBox(height: 50.0),
            _reduceFrictionSugguestion(context),
          ],
        ),
      ),
    );
  }

  Widget _reduceFrictionDetail(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I will make go for a run easier by ",
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

  Widget _reduceFrictionSugguestion(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
          padding: EdgeInsets.only(bottom:0), // Space between the label and the first suggestion
          child: Text(
            "Suggestions:", // The label text
            style: TextStyle(
              color: Colors.black, // Color of the label
              fontSize: 20, // Size of the label text
              // fontWeight: FontWeight.bold, // Bold text for the label
            ),
          ),
        ),
        ...suggestions.map((suggestion) => InkWell(
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
              // softWrap: true, // Allow text wrapping
              // overflow: TextOverflow.visible, // Show all text
            ),
          ),
        )).toList(),
        ],
      ),
    );
  }

}