import 'package:flutter/material.dart';

class FunAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Congratulations!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('You have completed the habit!'),
          SizedBox(height: 16),
          Image.asset(
            'assets/images/confetti.gif', // Add a fun image or gif
            height: 100,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}

void showFunAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return FunAlertDialog();
    },
  );
}