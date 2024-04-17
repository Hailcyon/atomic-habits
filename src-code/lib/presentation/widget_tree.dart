import "package:flutter/material.dart";
import 'package:ahapp3/presentation/auth.dart';
import 'package:ahapp3/presentation/log_in_screen/log_in_screen.dart';
import 'package:ahapp3/presentation/home_page_container_page/home_page_container_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}


class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
         if (snapshot.hasData) {
            return HomePageContainerPage();
         } else {
          return const LoginPage();
        }
      }
    );
  }
}