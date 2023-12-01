import 'bloc/home_page_check_habit_bloc.dart';
import 'models/home_page_check_habit_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/presentation/home_page_container_page/home_page_container_page.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_title.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_bottom_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomePageCheckHabitScreen extends StatelessWidget {
  HomePageCheckHabitScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomePageCheckHabitBloc>(
        create: (context) => HomePageCheckHabitBloc(HomePageCheckHabitState(
            homePageCheckHabitModelObj: HomePageCheckHabitModel()))
          ..add(HomePageCheckHabitInitialEvent()),
        child: HomePageCheckHabitScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<HomePageCheckHabitBloc, HomePageCheckHabitState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 18.v),
                  child: Column(children: [
                    _buildWidget(context),
                    SizedBox(height: 6.v),
                    _buildMon(context),
                    SizedBox(height: 28.v),
                    _buildGoForARun(context),
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
  Widget _buildWidget(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 41.h,
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_3".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 42.h,
              margin: EdgeInsets.only(left: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_4".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              margin: EdgeInsets.only(left: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 5.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_5".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 42.h,
              margin: EdgeInsets.only(left: 17.h),
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 5.v),
              decoration: AppDecoration.outlineBlack90001
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
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_8".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              margin: EdgeInsets.only(left: 18.h),
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_9".tr, style: theme.textTheme.titleLarge))
        ]));
  }

  /// Section Widget
  Widget _buildMon(BuildContext context) {
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
  Widget _buildGoForARun(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 72.adaptSize,
              width: 72.adaptSize,
              padding: EdgeInsets.all(15.h),
              decoration: IconButtonStyleHelper.fillLightGreenA,
              child: CustomImageView(imagePath: ImageConstant.imgCheckmark)),
          Expanded(
              child: CustomElevatedButton(
                  text: "lbl_go_for_a_run3".tr,
                  margin: EdgeInsets.only(left: 11.h),
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 30.h),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgIconDirectionsRun,
                          height: 35.v,
                          width: 30.h)),
                  buttonStyle: CustomButtonStyles.fillYellowTL10,
                  buttonTextStyle: CustomTextStyles.headlineMedium26,
                  onPressed: () {
                    onTapGoForARun(context);
                  }))
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
        return AppRoutes.homePageContainerPage;
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
      case AppRoutes.homePageContainerPage:
        return HomePageContainerPage.builder(context);
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the homePageContainer1Screen when the action is triggered.
  onTapGoForARun(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainer1Screen,
    );
  }
}
