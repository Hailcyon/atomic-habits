import 'bloc/make_it_easy_one_bloc.dart';
import 'models/make_it_easy_one_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MakeItEasyOneScreen extends StatelessWidget {
  const MakeItEasyOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MakeItEasyOneBloc>(
        create: (context) => MakeItEasyOneBloc(MakeItEasyOneState(
            makeItEasyOneModelObj: MakeItEasyOneModel()))
          ..add(MakeItEasyOneInitialEvent()),
        child: MakeItEasyOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<MakeItEasyOneBloc, MakeItEasyOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 27.h, vertical: 24.v),
                  child: Column(children: [
                    // SizedBox(height: 5.v),
                    _buildReduceFriction(context),
                    SizedBox(height: 5.v),
                    _buildTwoMinuteRule(context),
                    SizedBox(height: 5.v),
                    _buildHabitAutomation(context),
                    SizedBox(height: 5.v),
                    _buildEnvironmentPriming(context),
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 61.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBackButton,
            margin: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 6.v),
            onTap: () {
              onTapBackButton(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleTwo(text: "lbl_make_it_easy".tr));
  }

  /// Section Widget
  Widget _buildReduceFriction(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: Text("lbl_reduce_friction".tr,
                  style: CustomTextStyles.headlineMediumBlack90001_1)),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 23.v,
              width: 32.h,
              margin: EdgeInsets.only(top: 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildTwoMinuteRule(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: Text("lbl_two_minute_rule".tr,
                  style: CustomTextStyles.headlineMediumBlack90001_1)),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 23.v,
              width: 32.h,
              margin: EdgeInsets.only(top: 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildHabitAutomation(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: Text("msg_habit_automation".tr,
                  style: CustomTextStyles.headlineMediumBlack90001_1)),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 23.v,
              width: 32.h,
              margin: EdgeInsets.only(top: 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildEnvironmentPriming(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapEnvironmentPriming(context);
      },
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center, 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("msg_environment_priming".tr,
          //   style: CustomTextStyles.headlineMediumBlack90001_1
          // ),
          // CustomImageView(
          //   imagePath: ImageConstant.imgVector,
          //   height: 22.v,
          //   width: 33.h,
          //   margin: EdgeInsets.only(left: 52.h, top: 6.v, bottom: 3.v)
          // )
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: Text("msg_environment_priming".tr,
                  style: CustomTextStyles.headlineMediumBlack90001_1)),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 23.v,
              width: 32.h,
              margin: EdgeInsets.only(top: 13.v))
        ]
      )
    );
  }

  

  /// Navigates to the makeItEasyTwoScreen when the action is triggered.
  onTapEnvironmentPriming(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.makeItEasyTwoScreen,
    // );
    NavigatorService.pushNamed(
      AppRoutes.makeItEasyTwoScreen,
    );
  }

  // /// Section Widget
  // Widget _buildEnvDesign(BuildContext context) {
  //   return Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //             padding: EdgeInsets.only(bottom: 4.v),
  //             child: Text("msg_motivation_ritual".tr,
  //                 style: CustomTextStyles.headlineMediumBlack90001_1)),
  //         CustomImageView(
  //             imagePath: ImageConstant.imgVector,
  //             height: 23.v,
  //             width: 32.h,
  //             margin: EdgeInsets.only(top: 13.v))
  //       ]);
  // }

  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageThreeScreen,
    );
  }

  
}
