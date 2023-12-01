import 'bloc/make_it_attractive_two_bloc.dart';
import 'models/make_it_attractive_two_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class MakeItAttractiveTwoScreen extends StatelessWidget {
  const MakeItAttractiveTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MakeItAttractiveTwoBloc>(
        create: (context) => MakeItAttractiveTwoBloc(MakeItAttractiveTwoState(
            makeItAttractiveTwoModelObj: MakeItAttractiveTwoModel()))
          ..add(MakeItAttractiveTwoInitialEvent()),
        child: MakeItAttractiveTwoScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<MakeItAttractiveTwoBloc, MakeItAttractiveTwoState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.h, vertical: 24.v),
                  child: Column(children: [
                    _buildEnvPriming(context),
                    SizedBox(height: 39.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 351.h,
                            margin: EdgeInsets.only(left: 16.h, right: 39.h),
                            child: Text("msg_pair_a_habit_you".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium))),
                    SizedBox(height: 16.v),
                    CustomElevatedButton(
                        text: "lbl".tr,
                        buttonTextStyle: theme.textTheme.displayMedium!,
                        onPressed: () {
                          onTaptf(context);
                        }),
                    SizedBox(height: 32.v),
                    _buildNineteen(context),
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
        title: AppbarSubtitleTwo(text: "msg_make_it_attractive".tr));
  }

  /// Section Widget
  Widget _buildEnvPriming(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapEnvPriming(context);
        },
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("msg_temptation_bundling".tr,
                  style: CustomTextStyles.headlineMediumBlack90001Bold),
              CustomImageView(
                  imagePath: ImageConstant.imgVectorBlack900,
                  height: 22.v,
                  width: 33.h,
                  margin: EdgeInsets.only(left: 41.h, top: 6.v, bottom: 3.v))
            ])));
  }

  /// Section Widget
  Widget _buildNineteen(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text("msg_motivation_ritual".tr,
                      style: CustomTextStyles.headlineMediumBlack90001_1)),
              CustomImageView(
                  imagePath: ImageConstant.imgVector,
                  height: 22.v,
                  width: 32.h,
                  margin: EdgeInsets.only(top: 11.v))
            ]));
  }

  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageTwoScreen,
    );
  }

  /// Navigates to the makeItAttractiveOneScreen when the action is triggered.
  onTapEnvPriming(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItAttractiveOneScreen,
    );
  }

  /// Navigates to the implementationIntScreen when the action is triggered.
  onTaptf(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.implementationIntScreen,
    );
  }
}
