import 'package:ahapp3/presentation/add_new_habit_pages/habit_search_page.dart';
import 'package:flutter/material.dart';
import 'package:ahapp3/presentation/widget_tree.dart';
import 'package:ahapp3/presentation/log_in_screen/log_in_screen.dart';
import 'package:ahapp3/presentation/add_new_habit_pages/custom_habit_page.dart';
import 'package:ahapp3/presentation/add_new_habit_pages/add_new_habit_page.dart';

import 'package:ahapp3/presentation/law_three_page/law_three_page.dart';

class AppRoutes {
  static const String editAHabitPageScreen = '/edit_a_habit_page_screen';
  static const String loginScreenRoute = '/log_in_screen';
  static const String widgetTreeRoute = '/widget_tree.dart';
  static const String customHabitPageRoute = '/custom_habit_page.dart';
  static const String newHabitPageRoute = '/add_new_habit_page.dart';
  static const String habitSearchPageRoute = '/habit_search_page.dart';
  static const String initialRoute = widgetTreeRoute;

  static const String lawThreePageRout = '/law_three_page.dart';


  static Map<String, WidgetBuilder> get routes => {
        widgetTreeRoute: (context) => WidgetTree(),
        loginScreenRoute: (context) => LoginPage(),
        customHabitPageRoute: (context) => CustomHabitPage(),
        newHabitPageRoute: (context) => NewHabitPage(),
        habitSearchPageRoute: (context) => HabitSearchPage(),
        lawThreePageRout: (context) => LawThreePage(),
      };
}
