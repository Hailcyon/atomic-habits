import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: SizedBox(
              width: 375.h,
              child: Column(
                children: [
                  _buildAppNavigation(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "Sign up".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signUpScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Make it Attractive One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.makeItAttractiveOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Make it Attractive Two".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.makeItAttractiveTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Make it Attractive Three".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.makeItAttractiveThreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Add a New Habit".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.addANewHabitScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "New Habit Search".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.newHabitSearchScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Customize/Save Habit".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.customizeSaveHabitScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "implementation int edit".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.implementationIntEditScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Edit Habit Name".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.editHabitNameScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "implementation int".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.implementationIntScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Edit a Habit Page".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.editAHabitPageScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Edit a Habit Page Two".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.editAHabitPageTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Make it Obvious One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.makeItObviousOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Make it Obvious Two".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.makeItObviousTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Loading".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.loadingScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Home Page - Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.homePageContainerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Edit a Habit Page Three".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.editAHabitPageThreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "3rd Law Page".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.rdLawPageScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "3rd Law Action Page".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.rdLawActionPageScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "4th Law Page".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.thLawPageScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "4th Law Action Page".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.thLawActionPageScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Home Page check habit".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.homePageCheckHabitScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Home Page skip habit".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.homePageSkipHabitScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "environment priming".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.environmentPrimingScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "reinforcement".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.reinforcementScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Sign in".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signInScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
