import 'package:ahapp3/presentation/add_a_new_habit_screen/add_a_new_habit_screen.dart';

import 'bloc/home_page_container1_bloc.dart';
import 'models/home_page_container1_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/presentation/home_page_container_page/home_page_container_page.dart';
import 'package:ahapp3/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomePageContainer1Screen extends StatelessWidget {
  HomePageContainer1Screen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomePageContainer1Bloc>(
        create: (context) => HomePageContainer1Bloc(HomePageContainer1State(
            homePageContainer1ModelObj: HomePageContainer1Model()))
          ..add(HomePageContainer1InitialEvent()),
        child: HomePageContainer1Screen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<HomePageContainer1Bloc, HomePageContainer1State>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.homePageContainerPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.HomeIcon:
        return AppRoutes.homePageContainerPage;
      case BottomBarEnum.PlusIcon:
        return AppRoutes.addANewHabitScreen;
      case BottomBarEnum.StatisticsIcon:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePageContainerPage:
        return HomePageContainerPage.builder(context);
      case AppRoutes.addANewHabitScreen:
        return AddANewHabitScreen.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
