import 'dart:io';
import 'dart:convert';

import 'package:ahapp3/routes/app_routes.dart';
import 'package:ahapp3/core/utils/size_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';

import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_title.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';



class EditHabitPage extends StatelessWidget {
  const EditHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> dummy_mio = ["Run at 7 AM at Liberty Park", "Put running shoes near the front door"]; //Make it obvious habit laws -> will retrieve from database
    List<String> dummy_mia = ["Listen to educational audio-book while running."]; //make it attractive
    List<String> dummy_mie = ["Lay out running clothes by bed."]; //make it easy
    List<String> dummy_mis = ["Reward yourself after a 5 mile run."]; //make it satisfying

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Habit'),
      ),
      body: Center(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              _buildLaw(habitLaws: dummy_mio, buttonText: "Make it Obvious", context: context),
              _buildLaw(habitLaws: dummy_mia, buttonText: "Make it Attractive", context: context),
              _buildLaw(habitLaws: dummy_mie, buttonText: "Make it Easy", context: context),
              _buildLaw(habitLaws: dummy_mis, buttonText: "Make it Satisfying", context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLaw({required List habitLaws, required String buttonText, required BuildContext context}) {
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
        ...habitLaws.map((law) => buildHabitLaw(buttonText: law, context: context)),
        SizedBox(height: 8.0), // Add some space
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
                primary: const Color.fromARGB(255, 1, 82, 148),
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

  Widget buildHabitLaw({
    required String buttonText,
    required BuildContext context,
  }) {
    return Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 16),  // Right padding to match childrenPadding
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(buttonText),
                  style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 255, 255, 155),
                            fixedSize: Size(400, 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Larger corner radius
                            ),
                        ),
              ),
            ),
      );
    }
  }