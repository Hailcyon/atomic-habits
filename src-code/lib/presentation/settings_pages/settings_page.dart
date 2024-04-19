import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ahapp3/routes/app_routes.dart';

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
        title: Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 1, 82, 148),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Account Information'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.profilePageRoute);
            },
          ),
          // ListTile(
          //   title: Text('Notifications'),
          //   onTap: () {
          //     // Navigate to notifications page
          //   },
          // ),
          ListTile(
            title: Text('FAQs'),
            onTap: () {
              launchURL();
            },
          ),
          ListTile(
            title: Text('Help & Support'),
            onTap: () {
              launchURL();
            },
          ),
        ],
      ),
    );
  }

  launchURL() async {
    const url = 'https://ah-app.surge.sh';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
