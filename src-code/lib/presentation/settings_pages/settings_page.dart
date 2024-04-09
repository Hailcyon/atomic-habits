import 'package:flutter/material.dart';
import 'account_information_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Account Information'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountInformationPage()),
              );
            },
          ),
          ListTile(
            title: Text('Notifications'),
            onTap: () {
              // Navigate to notifications page
            },
          ),
          ListTile(
            title: Text('View all habits'),
            onTap: () {
              // Navigate to view all habits page
            },
          ),
          ListTile(
            title: Text('Delete habit from database or archive'),
            onTap: () {
              // Navigate to delete habit page
            },
          ),
          ListTile(
            title: Text('FAQs'),
            onTap: () {
              // Navigate to FAQs page
            },
          ),
          ListTile(
            title: Text('Help & Support'),
            onTap: () {
              // Navigate to help & support page
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {
              // Navigate to privacy policy page
            },
          ),
        ],
      ),
    );
  }
}

// Add additional pages for Account Information, Notifications, Habit Reminders, View all habits, Delete habit, FAQs, Help & Support, Privacy Policy
