import 'package:ahapp3/presentation/add_new_habit_pages/habit_search_page.dart';
import 'package:ahapp3/presentation//edit_a_habit_page/edit_a_habit_page.dart';
import 'package:ahapp3/presentation/statistics_pages/statistics_overview.dart';
import 'package:flutter/material.dart';
import 'package:ahapp3/presentation/widget_tree.dart';
import 'package:ahapp3/presentation/log_in_screen/log_in_screen.dart';
import 'package:ahapp3/presentation/add_new_habit_pages/custom_habit_page.dart';
import 'package:ahapp3/presentation/add_new_habit_pages/add_new_habit_page.dart';

import 'package:ahapp3/presentation/law_three_page/law_three_page.dart';
import 'package:ahapp3/presentation/settings_pages/profile_page.dart';
import 'package:ahapp3/presentation/home_page_container_page/home_page_container_page.dart';

import 'package:ahapp3/presentation/law_one_page/law_one_page.dart';
import 'package:ahapp3/presentation/law_two_page/law_two_page.dart';
import 'package:ahapp3/presentation/law_four_page/law_four_page.dart';
import 'package:ahapp3/presentation/settings_pages/settings_page.dart';

class AppRoutes {
  static const String editAHabitPageScreen = '/edit_a_habit_page_screen';
  static const String loginScreenRoute = '/log_in_screen';
  static const String widgetTreeRoute = '/widget_tree.dart';
  static const String customHabitPageRoute = '/custom_habit_page.dart';
  static const String newHabitPageRoute = '/add_new_habit_page.dart';
  static const String habitSearchPageRoute = '/habit_search_page.dart';
  static const String editHabitPageRoute = '/edit_a_habit_page.dart';
  static const String initialRoute = widgetTreeRoute;
  static const String profilePageRoute = '/profile_page.dart';
  static const String homePageRoute = '/home_page_container_page.dart';
  static const String statisticsPageRoute = '/statistics_overview.dart';

  static const String lawThreePageRout = '/law_three_page.dart';
  static const String lawOnePageRoute = '/law_one_page.dart';
  static const String lawTwoPageRoute = '/law_two_page.dart';
  static const String lawFourPageRoute = '/law_four_page.dart';
  static const String settingsPageRoute = '/settings_page.dart';
  static String currentPageID = '';

  static Map<String, WidgetBuilder> get routes => {
        widgetTreeRoute: (context) => WidgetTree(),
        profilePageRoute: (context) => ProfilePage(),
        loginScreenRoute: (context) => LoginPage(),
        customHabitPageRoute: (context) => CustomHabitPage(),
        newHabitPageRoute: (context) => NewHabitPage(),
        habitSearchPageRoute: (context) => HabitSearchPage(),
        editHabitPageRoute: (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          // Check if the args is indeed the expected string (habitId)
          if (args is Set<String>) {
            return EditHabitPage(
              habitId: args.first,
              habitName: args.last,
            ); // Pass the habitId to the constructor
          } else {
            throw Exception(
                'EditHabitPage requires a habitId and habitName string as an argument');
          }
        },
        lawThreePageRout: (context) {
          // Extract the arguments from the current settings
          final args = ModalRoute.of(context)!.settings.arguments;
          // Check if the args is indeed the expected string (habitId)
          if (args is Set<String>) {
            return LawThreePage(
              habitId: args.first,
              habitName: args.last,
            ); // Pass the habitId to the constructor
          } else {
            throw Exception(
                'LawThreePage requires a habitId and habitName string as an argument');
          }
        },
        lawOnePageRoute: (context) {
          // Extract the arguments from the current settings
          final args = ModalRoute.of(context)!.settings.arguments;
          // Check if the args is indeed the expected string (habitId)
          if (args is Set<String>) {
            return LawOnePage(
              habitId: args.first,
              habitName: args.last,
            ); // Pass the habitId to the constructor
          } else {
            throw Exception(
                'LawOnePage requires a habitId and habitName string as an argument');
          }
        },
        lawTwoPageRoute: (context) {
          // Extract the arguments from the current settings
          final args = ModalRoute.of(context)!.settings.arguments;
          // Check if the args is indeed the expected string (habitId)
          if (args is Set<String>) {
            return LawTwoPage(
              habitId: args.first,
              habitName: args.last,
            ); // Pass the habitId to the constructor
          } else {
            throw Exception(
                'LawTwoPage requires a habitId and habitName string as an argument');
          }
        },
        lawFourPageRoute: (context) {
          // Extract the arguments from the current settings
          final args = ModalRoute.of(context)!.settings.arguments;
          // Check if the args is indeed the expected string (habitId)
          if (args is Set<String>) {
            return LawFourPage(
              habitId: args.first,
              habitName: args.last,
            ); // Pass the habitId to the constructor
          } else {
            throw Exception(
                'LawFourPage requires a habitId and habitName string as an argument');
          }
        },
        homePageRoute: (context) => HomePageContainerPage(),
        settingsPageRoute: (context) => SettingsPage(),
        statisticsPageRoute: (context) => StatisticsPage(),
      };
}
