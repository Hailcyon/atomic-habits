import 'package:ahapp3/presentation/add_new_habit_pages/habit_search_page.dart';
import 'package:ahapp3/presentation//edit_a_habit_page/edit_a_habit_page.dart';
import 'package:flutter/material.dart';
// import 'package:ahapp3/presentation/sign_up_screen/sign_up_screen.dart';
// import 'package:ahapp3/presentation/iphone_14_15_pro_max_two_screen/iphone_14_15_pro_max_two_screen.dart';
// import 'package:ahapp3/presentation/make_it_attractive_one_screen/make_it_attractive_one_screen.dart';
// import 'package:ahapp3/presentation/make_it_attractive_two_screen/make_it_attractive_two_screen.dart';
// import 'package:ahapp3/presentation/make_it_attractive_three_screen/make_it_attractive_three_screen.dart';
// import 'package:ahapp3/presentation/add_a_new_habit_screen/add_a_new_habit_screen.dart';
// import 'package:ahapp3/presentation/new_habit_search_screen/new_habit_search_screen.dart';
// import 'package:ahapp3/presentation/customize_save_habit_screen/customize_save_habit_screen.dart';
// import 'package:ahapp3/presentation/implementation_int_edit_screen/implementation_int_edit_screen.dart';
// import 'package:ahapp3/presentation/edit_habit_name_screen/edit_habit_name_screen.dart';
// import 'package:ahapp3/presentation/implementation_int_screen/implementation_int_screen.dart';
// import 'package:ahapp3/presentation/edit_a_habit_page_screen/edit_a_habit_page_screen.dart';
// import 'package:ahapp3/presentation/edit_a_habit_page_two_screen/edit_a_habit_page_two_screen.dart';
// import 'package:ahapp3/presentation/make_it_obvious_one_screen/make_it_obvious_one_screen.dart';
// import 'package:ahapp3/presentation/make_it_obvious_two_screen/make_it_obvious_two_screen.dart';
// import 'package:ahapp3/presentation/loading_screen/loading_screen.dart';
// import 'package:ahapp3/presentation/calendar_screen/calendar_screen.dart';
// import 'package:ahapp3/presentation/home_page_container1_screen/home_page_container1_screen.dart';
// import 'package:ahapp3/presentation/edit_a_habit_page_three_screen/edit_a_habit_page_three_screen.dart';
// import 'package:ahapp3/presentation/iphone_14_15_pro_max_one_screen/iphone_14_15_pro_max_one_screen.dart';
// import 'package:ahapp3/presentation/home_page_check_habit_screen/home_page_check_habit_screen.dart';
// import 'package:ahapp3/presentation/home_page_skip_habit_screen/home_page_skip_habit_screen.dart';
// import 'package:ahapp3/presentation/sign_in_screen/sign_in_screen.dart';
// import 'package:ahapp3/presentation/rd_law_action_page_screen/rd_law_action_page_screen.dart';
// import 'package:ahapp3/presentation/th_law_action_page_screen/th_law_action_page_screen.dart';
// import 'package:ahapp3/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:ahapp3/presentation/widget_tree.dart';
import 'package:ahapp3/presentation/log_in_screen/log_in_screen.dart';
import 'package:ahapp3/presentation/add_new_habit_pages/custom_habit_page.dart';
import 'package:ahapp3/presentation/add_new_habit_pages/add_new_habit_page.dart';
// import 'package:ahapp3/presentation/make_it_easy_one_screen/make_it_easy_one_screen.dart';
// import 'package:ahapp3/presentation/make_it_easy_two_screen/make_it_easy_two_screen.dart';
// import 'package:ahapp3/presentation/make_it_easy_three_screen/make_it_easy_three_screen.dart';

class AppRoutes {
  // static const String signUpScreen = '/sign_up_screen';

  // static const String iphone1415ProMaxTwoScreen =
  //     '/iphone_14_15_pro_max_two_screen';

  // static const String makeItAttractiveOneScreen =
  //     '/make_it_attractive_one_screen';

  // static const String makeItAttractiveTwoScreen =
  //     '/make_it_attractive_two_screen';

  // static const String makeItAttractiveThreeScreen =
  //     '/make_it_attractive_three_screen';

  // static const String addANewHabitScreen = '/add_a_new_habit_screen';

  // static const String newHabitSearchScreen = '/new_habit_search_screen';

  // static const String customizeSaveHabitScreen = '/customize_save_habit_screen';

  // static const String implementationIntEditScreen =
  //     '/implementation_int_edit_screen';

  // static const String editHabitNameScreen = '/edit_habit_name_screen';

  // static const String implementationIntScreen = '/implementation_int_screen';

  static const String editAHabitPageScreen = '/edit_a_habit_page_screen';

  // static const String editAHabitPageTwoScreen = '/edit_a_habit_page_two_screen';

  // static const String makeItObviousOneScreen = '/make_it_obvious_one_screen';

  // static const String makeItObviousTwoScreen = '/make_it_obvious_two_screen';

  // static const String loadingScreen = '/loading_screen';

  // static const String calendarScreen = '/calendar_screen';

  // static const String homePageContainerPage = '/home_page_container_page';

  // static const String homePageContainer1Screen = '/home_page_container1_screen';

  // static const String editAHabitPageThreeScreen =
  //     '/edit_a_habit_page_three_screen';

  // static const String iphone1415ProMaxOneScreen =
  //     '/iphone_14_15_pro_max_one_screen';

  // static const String homePageCheckHabitScreen =
  //     '/home_page_check_habit_screen';

  // static const String homePageSkipHabitScreen = '/home_page_skip_habit_screen';

  // static const String signInScreen = '/sign_in_screen';

  // static const String rdLawActionPageScreen = '/rd_law_action_page_screen';

  // static const String thLawActionPageScreen = '/th_law_action_page_screen';

  // static const String appNavigationScreen = '/app_navigation_screen';

  // static const String initialRoute = '/initialRoute';
  static const String loginScreenRoute = '/log_in_screen';
  static const String widgetTreeRoute = '/widget_tree.dart';
  static const String customHabitPageRoute = '/custom_habit_page.dart';
  static const String newHabitPageRoute = '/add_new_habit_page.dart';
  static const String habitSearchPageRoute = '/habit_search_page.dart';
  static const String editHabitPageRoute = '/edit_a_habit_page.dart';
  static const String initialRoute = widgetTreeRoute;

  // static const String makeItEasyOneScreen = '/make_it_easy_one_screen';
  // static const String makeItEasyTwoScreen = '/make_it_easy_two_screen';
  // static const String makeItEasyThreeScreen = '/make_it_easy_three_screen';

  static Map<String, WidgetBuilder> get routes => {
        widgetTreeRoute: (context) => WidgetTree(),
        loginScreenRoute: (context) => LoginPage(),
        customHabitPageRoute: (context) => CustomHabitPage(),
        newHabitPageRoute: (context) => NewHabitPage(),
        habitSearchPageRoute: (context) => HabitSearchPage(),
        editHabitPageRoute: (context) => EditHabitPage(),
        // makeItEasyOneScreen: MakeItEasyOneScreen.builder,
        // makeItEasyTwoScreen: MakeItEasyTwoScreen.builder,
        // makeItEasyThreeScreen: MakeItEasyThreeScreen.builder,
        // signUpScreen: SignUpScreen.builder,
        // iphone1415ProMaxTwoScreen: Iphone1415ProMaxTwoScreen.builder,
        // makeItAttractiveOneScreen: MakeItAttractiveOneScreen.builder,
        // makeItAttractiveTwoScreen: MakeItAttractiveTwoScreen.builder,
        // makeItAttractiveThreeScreen: MakeItAttractiveThreeScreen.builder,
        // addANewHabitScreen: AddANewHabitScreen.builder,
        // newHabitSearchScreen: NewHabitSearchScreen.builder,
        // customizeSaveHabitScreen: CustomizeSaveHabitScreen.builder,
        // implementationIntEditScreen: ImplementationIntEditScreen.builder,
        // editHabitNameScreen: EditHabitNameScreen.builder,
        // implementationIntScreen: ImplementationIntScreen.builder,
        // editAHabitPageScreen: EditAHabitPageScreen.builder,
        // editAHabitPageTwoScreen: EditAHabitPageTwoScreen.builder,
        // makeItObviousOneScreen: MakeItObviousOneScreen.builder,
        // makeItObviousTwoScreen: MakeItObviousTwoScreen.builder,
        // loadingScreen: LoadingScreen.builder,
        // calendarScreen: CalendarScreen.builder,
        // homePageContainer1Screen: HomePageContainer1Screen.builder,
        // editAHabitPageThreeScreen: EditAHabitPageThreeScreen.builder,
        // iphone1415ProMaxOneScreen: Iphone1415ProMaxOneScreen.builder,
        // homePageCheckHabitScreen: HomePageCheckHabitScreen.builder,
        // homePageSkipHabitScreen: HomePageSkipHabitScreen.builder,
        // signInScreen: SignInScreen.builder,
        // rdLawActionPageScreen: RdLawActionPageScreen.builder,
        // thLawActionPageScreen: ThLawActionPageScreen.builder,
        // appNavigationScreen: AppNavigationScreen.builder,
        // initialRoute: SignUpScreen.builder
      };
}
