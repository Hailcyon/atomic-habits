import "package:flutter/material.dart";
import 'package:ahapp3/core/app_export.dart';
import 'package:day_picker/day_picker.dart';

class CustomHabitPage extends StatelessWidget {
  CustomHabitPage({Key? key}) : super(key: key);
  final List<DayInWeek> _days = [
    DayInWeek("Mo", dayKey: "monday"),
    DayInWeek("Tu", dayKey: "tuesday"),
    DayInWeek("We", dayKey: "wednesday"),
    DayInWeek("Th", dayKey: "thursday"),
    DayInWeek("Fr", dayKey: "friday"),
    DayInWeek("Sa", dayKey: "saturday"),
    DayInWeek("Su", dayKey: "sunday"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _entryField('Habit Name', TextEditingController()),
              SizedBox(height: 40.v),
              SelectWeekDays(
                days: _days,
                onSelect: (values) {},
                boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    // 10% of the width, so there are ten blinds.
                    colors: [
                      Color.fromARGB(255, 243, 220, 115),
                      Color.fromARGB(255, 226, 192, 41),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.v),
              _saveButton(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Add a New Habit'),
      //leading: Icon(Icons.arrow_back_ios),
    );
  }

  Widget _saveButton() {
    return ElevatedButton(
      onPressed: () {
        // Button action
      },
      child: Text('Save', style: TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 1, 82, 148),
        fixedSize: Size(150, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Larger corner radius
        ),
      ),
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
