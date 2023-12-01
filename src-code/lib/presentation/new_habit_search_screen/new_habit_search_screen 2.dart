import 'bloc/new_habit_search_bloc.dart';
import 'models/new_habit_search_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class NewHabitSearchScreen extends StatelessWidget {
  const NewHabitSearchScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NewHabitSearchBloc>(
        create: (context) => NewHabitSearchBloc(
            NewHabitSearchState(newHabitSearchModelObj: NewHabitSearchModel()))
          ..add(NewHabitSearchInitialEvent()),
        child: NewHabitSearchScreen());
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
                padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 27.v),
                child: Column(children: [
                  _buildSearch(context),
                  SizedBox(height: 30.v),
                  _buildResult(context),
                  SizedBox(height: 16.v),
                  _buildResult1(context),
                  SizedBox(height: 16.v),
                  _buildResult2(context),
                  Spacer(),
                  Text("msg_not_what_you_re".tr,
                      style: CustomTextStyles.titleLargeMontserrat),
                  SizedBox(height: 25.v),
                  _buildCreateACustomHabit(context),
                  SizedBox(height: 41.v)
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
  Widget _buildSearch(BuildContext context) {
    return BlocSelector<NewHabitSearchBloc, NewHabitSearchState,
            TextEditingController?>(
        selector: (state) => state.searchController,
        builder: (context, searchController) {
          return CustomTextFormField(
              controller: searchController,
              hintText: "lbl_search".tr,
              hintStyle: CustomTextStyles.headlineMediumBlack90001_1,
              textInputAction: TextInputAction.done,
              suffix: Container(
                  margin: EdgeInsets.only(),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5.h)),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgRectangle51,
                      height: 68.v,
                      width: 351.h)),
              suffixConstraints: BoxConstraints(maxHeight: 68.v),
              contentPadding:
                  EdgeInsets.only(left: 21.h, top: 17.v, bottom: 17.v));
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
  Widget _buildResult2(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_result".tr, buttonStyle: CustomButtonStyles.fillYellow);
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

  /// Navigates to the homePageContainer1Screen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainer1Screen,
    );
  }

  /// Navigates to the customizeSaveHabitScreen when the action is triggered.
  onTapCreateACustomHabit(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.customizeSaveHabitScreen,
    );
  }
}
