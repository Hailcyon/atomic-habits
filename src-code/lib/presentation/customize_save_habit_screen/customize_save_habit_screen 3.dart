import 'bloc/customize_save_habit_bloc.dart';
import 'models/customize_save_habit_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_outlined_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomizeSaveHabitScreen extends StatelessWidget {
  const CustomizeSaveHabitScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CustomizeSaveHabitBloc>(
        create: (context) => CustomizeSaveHabitBloc(CustomizeSaveHabitState(
            customizeSaveHabitModelObj: CustomizeSaveHabitModel()))
          ..add(CustomizeSaveHabitInitialEvent()),
        child: CustomizeSaveHabitScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 39.h, vertical: 45.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Row(children: [
                            Text("lbl_icon".tr,
                                style: CustomTextStyles
                                    .titleLargeMontserratGray9000220),
                            Padding(
                                padding: EdgeInsets.only(left: 46.h),
                                child: Text("lbl_name".tr,
                                    style: CustomTextStyles
                                        .titleLargeMontserratGray9000220))
                          ]))),
                  SizedBox(height: 6.v),
                  Padding(
                      padding: EdgeInsets.only(left: 12.h, right: 19.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildIcondirectionsrun(context),
                            _buildGoforarun(context)
                          ])),
                  SizedBox(height: 27.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 36.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 5.v),
                                decoration: AppDecoration.outlineLightGreenA
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder18),
                                child: Text("lbl_3".tr,
                                    style: CustomTextStyles.titleLarge20)),
                            _buildFour(context),
                            Container(
                                width: 36.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 5.v),
                                decoration: AppDecoration.outlineLightGreenA
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder18),
                                child: Text("lbl_5".tr,
                                    style: CustomTextStyles.titleLarge20)),
                            _buildSix(context),
                            Container(
                                width: 36.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.h, vertical: 5.v),
                                decoration: AppDecoration.outlineLightGreenA
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder18),
                                child: Text("lbl_7".tr,
                                    style: CustomTextStyles.titleLarge20)),
                            Container(
                                width: 36.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 5.v),
                                decoration: AppDecoration.outlineLightGreenA
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder18),
                                child: Text("lbl_8".tr,
                                    style: CustomTextStyles.titleLarge20)),
                            Container(
                                width: 36.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 5.v),
                                decoration: AppDecoration.outlineLightGreenA
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder18),
                                child: Text("lbl_9".tr,
                                    style: CustomTextStyles.titleLarge20))
                          ])),
                  SizedBox(height: 7.v),
                  Padding(
                      padding: EdgeInsets.only(left: 7.h, right: 10.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("lbl_mon".tr,
                                style: CustomTextStyles.bodyLarge17),
                            Padding(
                                padding: EdgeInsets.only(left: 16.h),
                                child: Text("lbl_tue".tr,
                                    style: CustomTextStyles.bodyLarge17)),
                            Padding(
                                padding: EdgeInsets.only(left: 17.h),
                                child: Text("lbl_wed".tr,
                                    style: CustomTextStyles.bodyLarge17)),
                            Padding(
                                padding: EdgeInsets.only(left: 18.h),
                                child: Text("lbl_thu".tr,
                                    style: CustomTextStyles.bodyLarge17)),
                            Padding(
                                padding: EdgeInsets.only(left: 25.h),
                                child: Text("lbl_fri".tr,
                                    style: CustomTextStyles.bodyLarge17)),
                            Padding(
                                padding: EdgeInsets.only(left: 24.h),
                                child: Text("lbl_sat".tr,
                                    style: CustomTextStyles.bodyLarge17)),
                            Padding(
                                padding: EdgeInsets.only(left: 21.h),
                                child: Text("lbl_sun".tr,
                                    style: CustomTextStyles.bodyLarge17))
                          ])),
                  SizedBox(height: 22.v),
                  _buildSave(context),
                  Spacer(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_similar_habits".tr,
                          style: CustomTextStyles.titleLargeMontserrat)),
                  SizedBox(height: 11.v),
                  _buildResult(context),
                  SizedBox(height: 16.v),
                  _buildResult1(context),
                  SizedBox(height: 28.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          child: Text("lbl_or".tr,
                              style: CustomTextStyles.titleLargeMontserrat))),
                  SizedBox(height: 28.v),
                  _buildSearchForAHabit(context),
                  SizedBox(height: 23.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 61.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBackButton,
            margin: EdgeInsets.only(left: 16.h, top: 8.v, bottom: 5.v),
            onTap: () {
              onTapBackButton(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_add_a_new_habit".tr));
  }

  /// Section Widget
  Widget _buildIcondirectionsrun(BuildContext context) {
    return BlocSelector<CustomizeSaveHabitBloc, CustomizeSaveHabitState,
            TextEditingController?>(
        selector: (state) => state.icondirectionsrunController,
        builder: (context, icondirectionsrunController) {
          return CustomTextFormField(
              width: 59.h,
              controller: icondirectionsrunController,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(14.h, 7.v, 15.h, 7.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgIconDirectionsRun,
                      height: 35.v,
                      width: 30.h)),
              suffixConstraints: BoxConstraints(maxHeight: 49.v),
              borderDecoration: TextFormFieldStyleHelper.fillGray,
              fillColor: appTheme.gray300);
        });
  }

  /// Section Widget
  Widget _buildGoforarun(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 26.h),
            child: BlocSelector<CustomizeSaveHabitBloc, CustomizeSaveHabitState,
                    TextEditingController?>(
                selector: (state) => state.goforarunController,
                builder: (context, goforarunController) {
                  return CustomTextFormField(
                      controller: goforarunController,
                      hintText: "lbl_go_for_a_run2".tr,
                      textInputAction: TextInputAction.done,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 14.h, vertical: 11.v),
                      borderDecoration: TextFormFieldStyleHelper.fillGray,
                      fillColor: appTheme.gray300);
                })));
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return CustomOutlinedButton(width: 38.h, text: "lbl_4".tr);
  }

  /// Section Widget
  Widget _buildSix(BuildContext context) {
    return CustomOutlinedButton(width: 37.h, text: "lbl_6".tr);
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
        height: 55.v,
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 6.h, right: 7.h),
        buttonTextStyle: theme.textTheme.displaySmall!,
        onPressed: () {
          onTapSave(context);
        });
  }

  /// Section Widget
  Widget _buildResult(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_result".tr, buttonStyle: CustomButtonStyles.fillYellow);
  }

  /// Section Widget
  Widget _buildResult1(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_result".tr, buttonStyle: CustomButtonStyles.fillYellow);
  }

  /// Section Widget
  Widget _buildSearchForAHabit(BuildContext context) {
    return CustomElevatedButton(
        text: "msg_search_for_a_habit".tr,
        buttonTextStyle: CustomTextStyles.headlineMediumAmber200,
        onPressed: () {
          onTapSearchForAHabit(context);
        });
  }

  /// Navigates to the homePageContainer1Screen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainer1Screen,
    );
  }

  /// Navigates to the homePageContainer1Screen when the action is triggered.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainer1Screen,
    );
  }

  /// Navigates to the newHabitSearchScreen when the action is triggered.
  onTapSearchForAHabit(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.newHabitSearchScreen,
    );
  }
}
