import 'bloc/home_page_skip_habit_bloc.dart';
import 'models/home_page_skip_habit_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/presentation/home_page/home_page.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_title.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_bottom_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomePageSkipHabitScreen extends StatelessWidget {
  HomePageSkipHabitScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomePageSkipHabitBloc>(
        create: (context) => HomePageSkipHabitBloc(HomePageSkipHabitState(
            homePageSkipHabitModelObj: HomePageSkipHabitModel()))
          ..add(HomePageSkipHabitInitialEvent()),
        child: HomePageSkipHabitScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<HomePageSkipHabitBloc, HomePageSkipHabitState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 18.v),
                  child: Column(children: [
                    _buildTwentyNine(context),
                    SizedBox(height: 6.v),
                    _buildSeventy(context),
                    SizedBox(height: 28.v),
                    _buildSeventyOne(context),
                    SizedBox(height: 5.v)
                  ])),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 113.v,
        leadingWidth: 79.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgThreeLinesPic,
            margin: EdgeInsets.only(left: 35.h, top: 1.v, bottom: 17.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_today".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCalendarPic,
              margin: EdgeInsets.only(left: 36.h, right: 36.h, bottom: 12.v))
        ]);
  }

  /// Section Widget
  Widget _buildTwentyNine(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 41.h,
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_3".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 42.h,
              margin: EdgeInsets.only(left: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_4".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              margin: EdgeInsets.only(left: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 5.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_5".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 42.h,
              margin: EdgeInsets.only(left: 17.h),
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 5.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_6".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              margin: EdgeInsets.only(left: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 6.v),
              decoration: AppDecoration.outlineLightGreenA
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_7".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              margin: EdgeInsets.only(left: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_8".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              margin: EdgeInsets.only(left: 18.h),
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_9".tr, style: theme.textTheme.titleLarge))
        ]));
  }

  /// Section Widget
  Widget _buildSeventy(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 23.h, right: 27.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("lbl_mon".tr, style: theme.textTheme.bodyLarge),
          Padding(
              padding: EdgeInsets.only(left: 19.h),
              child: Text("lbl_tue".tr, style: theme.textTheme.bodyLarge)),
          Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text("lbl_wed".tr, style: theme.textTheme.bodyLarge)),
          Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text("lbl_thu".tr, style: theme.textTheme.bodyLarge)),
          Padding(
              padding: EdgeInsets.only(left: 28.h),
              child: Text("lbl_fri".tr, style: theme.textTheme.bodyLarge)),
          Padding(
              padding: EdgeInsets.only(left: 29.h),
              child: Text("lbl_sat".tr, style: theme.textTheme.bodyLarge)),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Text("lbl_sun".tr, style: theme.textTheme.bodyLarge))
        ]));
  }

  /// Section Widget
  Widget _buildSeventyOne(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 9.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: CustomElevatedButton(
                  text: "lbl_go_for_a_run3".tr,
                  rightIcon: Container(
                      margin: EdgeInsets.only(left: 30.h),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgVectorBlack90015x25,
                          height: 17.adaptSize,
                          width: 17.adaptSize)),
                  buttonStyle: CustomButtonStyles.fillYellowTL10,
                  buttonTextStyle:
                      CustomTextStyles.headlineMediumPrimaryContainer,
                  onPressed: () {
                    onTapGoForARun(context);
                  })),
          Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: CustomIconButton(
                  height: 72.adaptSize,
                  width: 72.adaptSize,
                  padding: EdgeInsets.all(7.h),
                  decoration: IconButtonStyleHelper.fillOnPrimaryContainer,
                  child: CustomImageView(imagePath: ImageConstant.imgClose)))
        ]));
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
      case BottomBarEnum.Vectorlime50:
        return AppRoutes.homePage;
      case BottomBarEnum.Vectorlime5037x41:
        return "/";
      case BottomBarEnum.Vectorlime5037x36:
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
      case AppRoutes.homePage:
        return HomePage.builder(context);
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the homePageContainerScreen when the action is triggered.
  onTapGoForARun(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainerScreen,
    );
  }
}
