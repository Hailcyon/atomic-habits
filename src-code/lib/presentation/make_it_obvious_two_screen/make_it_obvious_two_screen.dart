import 'bloc/make_it_obvious_two_bloc.dart';
import 'models/make_it_obvious_two_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class MakeItObviousTwoScreen extends StatelessWidget {
  const MakeItObviousTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MakeItObviousTwoBloc>(
        create: (context) => MakeItObviousTwoBloc(MakeItObviousTwoState(
            makeItObviousTwoModelObj: MakeItObviousTwoModel()))
          ..add(MakeItObviousTwoInitialEvent()),
        child: MakeItObviousTwoScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<MakeItObviousTwoBloc, MakeItObviousTwoState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.h, vertical: 22.v),
                  child: Column(children: [
                    _buildEnvPriming(context),
                    SizedBox(height: 8.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 341.h,
                            margin: EdgeInsets.only(left: 17.h, right: 49.h),
                            child: Text("msg_transform_your_goal".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium))),
                    SizedBox(height: 14.v),
                    CustomElevatedButton(
                        text: "lbl".tr,
                        buttonTextStyle: theme.textTheme.displayMedium!,
                        onPressed: () {
                          onTaptf(context);
                        }),
                    SizedBox(height: 35.v),
                    Padding(
                        padding: EdgeInsets.only(left: 18.h, right: 14.h),
                        child: _buildTwenty(context,
                            msg: "lbl_habit_stacking".tr)),
                    SizedBox(height: 26.v),
                    Padding(
                        padding: EdgeInsets.only(left: 18.h, right: 14.h),
                        child: _buildTwenty(context,
                            msg: "msg_environment_design".tr)),
                    SizedBox(height: 5.v)
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
        title: AppbarSubtitleTwo(text: "lbl_make_it_obvious".tr));
  }

  /// Section Widget
  Widget _buildEnvPriming(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapEnvPriming(context);
        },
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 221.h,
                      child: Text("msg_implementation_intention".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.headlineMedium)),
                  CustomImageView(
                      imagePath: ImageConstant.imgVectorBlack900,
                      height: 22.v,
                      width: 33.h,
                      margin:
                          EdgeInsets.only(left: 121.h, top: 9.v, bottom: 34.v))
                ])));
  }

  /// Common widget
  Widget _buildTwenty(
    BuildContext context, {
    required String msg,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Text(msg,
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: appTheme.black900))),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 23.v,
              width: 32.h,
              margin: EdgeInsets.only(left: 63.h, top: 10.v))
        ]);
  }

  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageTwoScreen,
    );
  }

  /// Navigates to the makeItObviousOneScreen when the action is triggered.
  onTapEnvPriming(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItObviousOneScreen,
    );
  }

  /// Navigates to the implementationIntScreen when the action is triggered.
  onTaptf(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.implementationIntScreen,
    );
  }
}
