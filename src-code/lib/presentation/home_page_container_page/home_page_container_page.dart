import 'bloc/home_page_container_bloc.dart';
import 'models/home_page_container_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_title.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class HomePageContainerPage extends StatelessWidget {
  const HomePageContainerPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HomePageContainerBloc>(
        create: (context) => HomePageContainerBloc(HomePageContainerState(
            homePageContainerModelObj: HomePageContainerModel()))
          ..add(HomePageContainerInitialEvent()),
        child: HomePageContainerPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<HomePageContainerBloc, HomePageContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
                  child: Column(children: [
                    _buildWidget(context),
                    SizedBox(height: 6.v),
                    _buildMon(context),
                    SizedBox(height: 28.v),
                    CustomElevatedButton(
                        text: "lbl_go_for_a_run3".tr,
                        margin: EdgeInsets.only(right: 8.h),
                        rightIcon: Container(
                            margin: EdgeInsets.only(left: 30.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgVectorBlack90015x25,
                                height: 17.adaptSize,
                                width: 17.adaptSize)),
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
                        }),
                    SizedBox(height: 5.v)
                  ]))));
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
              margin: EdgeInsets.only(left: 36.h, right: 36.h, bottom: 12.v),
              onTap: () {
                onTapCalendarPic(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildWidget(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              width: 41.h,
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_3".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 42.h,
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_4".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 5.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_5".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 42.h,
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 5.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_6".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 6.v),
              decoration: AppDecoration.outlineLightGreenA
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_7".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_8".tr, style: theme.textTheme.titleLarge)),
          Container(
              width: 41.h,
              padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 6.v),
              decoration: AppDecoration.outlineBlack90001
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_9".tr, style: theme.textTheme.titleLarge))
        ]));
  }

  /// Section Widget
  Widget _buildMon(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 12.h),
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

  /// Navigates to the calendarScreen when the action is triggered.
  onTapCalendarPic(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.calendarScreen,
    );
  }

  /// Navigates to the editAHabitPageScreen when the action is triggered.
  onTapGoForARun(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageScreen,
    );
  }
}
