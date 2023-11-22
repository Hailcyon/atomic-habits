import 'package:flutter/material.dart';
import 'package:ahapp3/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:ahapp3/presentation/make_it_attractive_one_screen/make_it_attractive_one_screen.dart';
import 'package:ahapp3/presentation/make_it_attractive_two_screen/make_it_attractive_two_screen.dart';
import 'package:ahapp3/presentation/make_it_attractive_three_screen/make_it_attractive_three_screen.dart';
import 'package:ahapp3/presentation/add_a_new_habit_screen/add_a_new_habit_screen.dart';
import 'package:ahapp3/presentation/new_habit_search_screen/new_habit_search_screen.dart';
import 'package:ahapp3/presentation/customize_save_habit_screen/customize_save_habit_screen.dart';
import 'package:ahapp3/presentation/implementation_int_edit_screen/implementation_int_edit_screen.dart';
import 'package:ahapp3/presentation/edit_habit_name_screen/edit_habit_name_screen.dart';
import 'package:ahapp3/presentation/implementation_int_screen/implementation_int_screen.dart';
import 'package:ahapp3/presentation/edit_a_habit_page_screen/edit_a_habit_page_screen.dart';
import 'package:ahapp3/presentation/edit_a_habit_page_two_screen/edit_a_habit_page_two_screen.dart';
import 'package:ahapp3/presentation/make_it_obvious_one_screen/make_it_obvious_one_screen.dart';
import 'package:ahapp3/presentation/make_it_obvious_two_screen/make_it_obvious_two_screen.dart';
import 'package:ahapp3/presentation/loading_screen/loading_screen.dart';
import 'package:ahapp3/presentation/home_page_container_screen/home_page_container_screen.dart';
import 'package:ahapp3/presentation/edit_a_habit_page_three_screen/edit_a_habit_page_three_screen.dart';
import 'package:ahapp3/presentation/rd_law_page_screen/rd_law_page_screen.dart';
import 'package:ahapp3/presentation/rd_law_action_page_screen/rd_law_action_page_screen.dart';
import 'package:ahapp3/presentation/th_law_page_screen/th_law_page_screen.dart';
import 'package:ahapp3/presentation/th_law_action_page_screen/th_law_action_page_screen.dart';
import 'package:ahapp3/presentation/home_page_check_habit_screen/home_page_check_habit_screen.dart';
import 'package:ahapp3/presentation/home_page_skip_habit_screen/home_page_skip_habit_screen.dart';
import 'package:ahapp3/presentation/environment_priming_screen/environment_priming_screen.dart';
import 'package:ahapp3/presentation/reinforcement_screen/reinforcement_screen.dart';
import 'package:ahapp3/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:ahapp3/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String signUpScreen = '/sign_up_screen';

  static const String makeItAttractiveOneScreen =
      '/make_it_attractive_one_screen';

  static const String makeItAttractiveTwoScreen =
      '/make_it_attractive_two_screen';

  static const String makeItAttractiveThreeScreen =
      '/make_it_attractive_three_screen';

  static const String addANewHabitScreen = '/add_a_new_habit_screen';

  static const String newHabitSearchScreen = '/new_habit_search_screen';

  static const String customizeSaveHabitScreen = '/customize_save_habit_screen';

  static const String implementationIntEditScreen =
      '/implementation_int_edit_screen';

  static const String editHabitNameScreen = '/edit_habit_name_screen';

  static const String implementationIntScreen = '/implementation_int_screen';

  static const String editAHabitPageScreen = '/edit_a_habit_page_screen';

  static const String editAHabitPageTwoScreen = '/edit_a_habit_page_two_screen';

  static const String makeItObviousOneScreen = '/make_it_obvious_one_screen';

  static const String makeItObviousTwoScreen = '/make_it_obvious_two_screen';

  static const String loadingScreen = '/loading_screen';

  static const String homePage = '/home_page';

  static const String homePageContainerScreen = '/home_page_container_screen';

  static const String editAHabitPageThreeScreen =
      '/edit_a_habit_page_three_screen';

  static const String rdLawPageScreen = '/rd_law_page_screen';

  static const String rdLawActionPageScreen = '/rd_law_action_page_screen';

  static const String thLawPageScreen = '/th_law_page_screen';

  static const String thLawActionPageScreen = '/th_law_action_page_screen';

  static const String homePageCheckHabitScreen =
      '/home_page_check_habit_screen';

  static const String homePageSkipHabitScreen = '/home_page_skip_habit_screen';

  static const String environmentPrimingScreen = '/environment_priming_screen';

  static const String reinforcementScreen = '/reinforcement_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        signUpScreen: SignUpScreen.builder,
        makeItAttractiveOneScreen: MakeItAttractiveOneScreen.builder,
        makeItAttractiveTwoScreen: MakeItAttractiveTwoScreen.builder,
        makeItAttractiveThreeScreen: MakeItAttractiveThreeScreen.builder,
        addANewHabitScreen: AddANewHabitScreen.builder,
        newHabitSearchScreen: NewHabitSearchScreen.builder,
        customizeSaveHabitScreen: CustomizeSaveHabitScreen.builder,
        implementationIntEditScreen: ImplementationIntEditScreen.builder,
        editHabitNameScreen: EditHabitNameScreen.builder,
        implementationIntScreen: ImplementationIntScreen.builder,
        editAHabitPageScreen: EditAHabitPageScreen.builder,
        editAHabitPageTwoScreen: EditAHabitPageTwoScreen.builder,
        makeItObviousOneScreen: MakeItObviousOneScreen.builder,
        makeItObviousTwoScreen: MakeItObviousTwoScreen.builder,
        loadingScreen: LoadingScreen.builder,
        homePageContainerScreen: HomePageContainerScreen.builder,
        editAHabitPageThreeScreen: EditAHabitPageThreeScreen.builder,
        rdLawPageScreen: RdLawPageScreen.builder,
        rdLawActionPageScreen: RdLawActionPageScreen.builder,
        thLawPageScreen: ThLawPageScreen.builder,
        thLawActionPageScreen: ThLawActionPageScreen.builder,
        homePageCheckHabitScreen: HomePageCheckHabitScreen.builder,
        homePageSkipHabitScreen: HomePageSkipHabitScreen.builder,
        environmentPrimingScreen: EnvironmentPrimingScreen.builder,
        reinforcementScreen: ReinforcementScreen.builder,
        signInScreen: SignInScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SignUpScreen.builder
      };
}
