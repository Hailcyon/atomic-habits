import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AccountInformationPage extends StatefulWidget {
  const AccountInformationPage({Key? key}) : super(key: key);

  @override
  State<AccountInformationPage> createState() => _AccountInformationPage();
}

class _AccountInformationPage extends State<AccountInformationPage> {
  late User? _user;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _usernameController = TextEditingController(text: _user?.displayName ?? '');
    _emailController = TextEditingController(text: _user?.email ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to save changes to account information
                saveChanges();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  void saveChanges() {
    // Implement logic to save changes to account information
    String newUsername = _usernameController.text;
    String newEmail = _emailController.text;

    // Update user's display name if it's changed
    if (_user?.displayName != newUsername) {
      _user?.updateDisplayName(newUsername).then((_) {
        // Update successful
        print('Username updated successfully');
      }).catchError((error) {
        // An error occurred
        print('Failed to update username: $error');
      });
    }

      // Check if new email is different from current email
    if (_user?.email != newEmail) {
      // Send email verification to new email address
      _user?.updateEmail(newEmail).then((_) {
        // Email updated successfully
        // Send email verification to the new email address
        _user?.sendEmailVerification().then((_) {
          // Email verification sent
          print('Email verification sent to $newEmail');
        }).catchError((error) {
          // An error occurred while sending email verification
          print('Failed to send email verification to $newEmail: $error');
        });
      }).catchError((error) {
        // An error occurred while updating email
        print('Failed to update email: $error');
      });
    };

    // Show a snackbar or dialog to indicate changes saved
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Changes saved successfully'),
      ),
    );
  }
}