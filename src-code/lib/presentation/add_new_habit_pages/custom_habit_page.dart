import "package:flutter/material.dart";

class CustomHabitPage extends StatelessWidget {
  const CustomHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _saveButton(),
          ],
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
      onPressed: () {},
      child: const Text('Save'),
    );
  }
}
