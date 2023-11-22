import 'bloc/add_a_new_habit_bloc.dart';
import 'models/add_a_new_habit_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AddANewHabitScreen extends StatelessWidget {
  const AddANewHabitScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AddANewHabitBloc>(
        create: (context) => AddANewHabitBloc(
            AddANewHabitState(addANewHabitModelObj: AddANewHabitModel()))
          ..add(AddANewHabitInitialEvent()),
        child: AddANewHabitScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<AddANewHabitBloc, AddANewHabitState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 38.h, vertical: 19.v),
                  child: Column(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text("msg_try_one_of_our_suggestions".tr,
                                style: CustomTextStyles.titleLargeMontserrat))),
                    SizedBox(height: 25.v),
                    _buildGoForARun(context),
                    SizedBox(height: 16.v),
                    _buildMeditate(context),
                    SizedBox(height: 16.v),
                    _buildTakeVitamins(context),
                    SizedBox(height: 16.v),
                    _buildReadABook(context),
                    SizedBox(height: 16.v),
                    GestureDetector(
                        onTap: () {
                          onTapTxtSearchForMore(context);
                        },
                        child: Text("lbl_search_for_more".tr,
                            style: CustomTextStyles
                                .titleLargeMontserratPrimary23
                                .copyWith(
                                    decoration: TextDecoration.underline))),
                    Spacer(),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 12.h),
                            child: Text("lbl_or".tr,
                                style: CustomTextStyles.titleLargeMontserrat))),
                    SizedBox(height: 28.v),
                    _buildCreateACustomHabit(context),
                    SizedBox(height: 49.v)
                  ]))));
    });
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
  Widget _buildGoForARun(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_go_for_a_run".tr,
        buttonStyle: CustomButtonStyles.fillYellow,
        onPressed: () {
          onTapGoForARun(context);
        });
  }

  /// Section Widget
  Widget _buildMeditate(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_meditate".tr, buttonStyle: CustomButtonStyles.fillYellow);
  }

  /// Section Widget
  Widget _buildTakeVitamins(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_take_vitamins".tr,
        buttonStyle: CustomButtonStyles.fillYellow);
  }

  /// Section Widget
  Widget _buildReadABook(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_read_a_book".tr, buttonStyle: CustomButtonStyles.fillYellow);
  }

  /// Section Widget
  Widget _buildCreateACustomHabit(BuildContext context) {
    return CustomElevatedButton(
        text: "msg_create_a_custom".tr,
        buttonTextStyle: CustomTextStyles.headlineMediumAmber200,
        onPressed: () {
          onTapCreateACustomHabit(context);
        });
  }

  /// Navigates to the homePageContainerScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainerScreen,
    );
  }

  /// Navigates to the customizeSaveHabitScreen when the action is triggered.
  onTapGoForARun(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.customizeSaveHabitScreen,
    );
  }

  /// Navigates to the newHabitSearchScreen when the action is triggered.
  onTapTxtSearchForMore(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.newHabitSearchScreen,
    );
  }

  /// Navigates to the customizeSaveHabitScreen when the action is triggered.
  onTapCreateACustomHabit(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.customizeSaveHabitScreen,
    );
  }
}
