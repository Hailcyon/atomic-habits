import 'bloc/make_it_easy_two_bloc.dart';
import 'models/make_it_easy_two_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class MakeItEasyTwoScreen extends StatelessWidget {
  const MakeItEasyTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MakeItEasyTwoBloc>(
        create: (context) => MakeItEasyTwoBloc(MakeItEasyTwoState(
            makeItEasyTwoModelObj: MakeItEasyTwoModel()))
          ..add(MakeItEasyTwoInitialEvent()),
        child: MakeItEasyTwoScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<MakeItEasyTwoBloc, MakeItEasyTwoState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.h, vertical: 24.v),
                  child: Column(children: [
                     _buildReduceFriction(context),
                    SizedBox(height: 5.v),
                    _buildTwoMinuteRule(context),
                    SizedBox(height: 5.v),
                    _buildHabitAutomation(context),
                    SizedBox(height: 5.v),
                    _buildEnvironmentPriming(context),

                    // _buildEnvPriming(context),
                    SizedBox(height: 16.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 351.h,
                            margin: EdgeInsets.only(left: 3.h, right: 39.h),
                            child: Text("Decrease steps between you and a habit".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium))),
                    SizedBox(height: 20.v),
                    CustomElevatedButton(
                        text: "lbl".tr,
                        buttonTextStyle: theme.textTheme.displayMedium!,
                        onPressed: () {
                          onTaptf(context);
                        }),
                    SizedBox(height: 32.v),
                    // _buildNineteen(context),
                    // SizedBox(height: 5.v)
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: Text("msg_environment_priming".tr,
                  style: CustomTextStyles.headlineMediumBlack90001_1)),
          CustomImageView(
              imagePath: ImageConstant.imgVectorBlack900,
              height: 23.v,
              width: 32.h,
              margin: EdgeInsets.only(top: 13.v))
        ]
      )
    );
  }


  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageThreeScreen,
    );
  }

  /// Navigates to the makeItAttractiveOneScreen when the action is triggered.
  onTapEnvironmentPriming(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItEasyOneScreen,
    );
  }

  /// Navigates to the implementationIntScreen when the action is triggered.
  onTaptf(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.implementationIntScreen,
    // );
    NavigatorService.pushNamed(
      AppRoutes.makeItEasyThreeScreen,
    );
  }
}
