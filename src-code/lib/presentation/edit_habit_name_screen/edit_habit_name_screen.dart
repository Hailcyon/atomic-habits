import 'bloc/edit_habit_name_bloc.dart';
import 'models/edit_habit_name_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_outlined_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditHabitNameScreen extends StatelessWidget {
  const EditHabitNameScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EditHabitNameBloc>(
        create: (context) => EditHabitNameBloc(
            EditHabitNameState(editHabitNameModelObj: EditHabitNameModel()))
          ..add(EditHabitNameInitialEvent()),
        child: EditHabitNameScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: 374.h,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 16.v),
                child: Column(children: [
                  Text("lbl_habit_name".tr,
                      style: CustomTextStyles
                          .titleLargeMontserratPrimaryContainer20),
                  SizedBox(height: 11.v),
                  _buildHabitName(context),
                  SizedBox(height: 12.v),
                  Text("lbl_habit_icon".tr,
                      style: CustomTextStyles
                          .titleLargeMontserratPrimaryContainer20),
                  SizedBox(height: 2.v),
                  Container(
                      height: 49.v,
                      width: 59.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.h, vertical: 7.v),
                      decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgIconDirectionsRun,
                          height: 35.v,
                          width: 30.h,
                          alignment: Alignment.centerLeft)),
                  SizedBox(height: 14.v),
                  Text("lbl_habit_days".tr,
                      style: CustomTextStyles
                          .titleLargeMontserratPrimaryContainer20),
                  SizedBox(height: 9.v),
                  _buildHabitDays(context),
                  SizedBox(height: 7.v),
                  _buildFortyFour(context)
                ])),
            bottomNavigationBar: _buildSave(context)));
  }

  /// Section Widget
  Widget _buildHabitName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h),
        child: BlocSelector<EditHabitNameBloc, EditHabitNameState,
                TextEditingController?>(
            selector: (state) => state.habitNameController,
            builder: (context, habitNameController) {
              return CustomTextFormField(
                  controller: habitNameController,
                  hintText: "lbl_go_for_a_run2".tr,
                  textInputAction: TextInputAction.done,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 11.v),
                  borderDecoration: TextFormFieldStyleHelper.fillGray,
                  fillColor: appTheme.gray300);
            }));
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
  Widget _buildHabitDays(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              width: 36.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 5.v),
              decoration: AppDecoration.outlineSecondaryContainer
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_3".tr, style: CustomTextStyles.titleLarge20)),
          _buildFour(context),
          Container(
              width: 36.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 5.v),
              decoration: AppDecoration.outlineSecondaryContainer
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_5".tr, style: CustomTextStyles.titleLarge20)),
          _buildSix(context),
          Container(
              width: 36.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 5.v),
              decoration: AppDecoration.outlineSecondaryContainer
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_7".tr, style: CustomTextStyles.titleLarge20)),
          Container(
              width: 36.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 5.v),
              decoration: AppDecoration.outlineSecondaryContainer
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_8".tr, style: CustomTextStyles.titleLarge20)),
          Container(
              width: 36.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 5.v),
              decoration: AppDecoration.outlineSecondaryContainer
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: Text("lbl_9".tr, style: CustomTextStyles.titleLarge20))
        ]));
  }

  /// Section Widget
  Widget _buildFortyFour(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 3.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("lbl_mon".tr, style: CustomTextStyles.bodyLarge17),
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text("lbl_tue".tr, style: CustomTextStyles.bodyLarge17)),
          Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Text("lbl_wed".tr, style: CustomTextStyles.bodyLarge17)),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: Text("lbl_thu".tr, style: CustomTextStyles.bodyLarge17)),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Text("lbl_fri".tr, style: CustomTextStyles.bodyLarge17)),
          Padding(
              padding: EdgeInsets.only(left: 24.h),
              child: Text("lbl_sat".tr, style: CustomTextStyles.bodyLarge17)),
          Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text("lbl_sun".tr, style: CustomTextStyles.bodyLarge17))
        ]));
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
        height: 55.v,
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 21.h, right: 14.h, bottom: 17.v),
        buttonTextStyle: theme.textTheme.displaySmall!,
        onPressed: () {
          onTapSave(context);
        });
  }

  /// Navigates to the editAHabitPageScreen when the action is triggered.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageScreen,
    );
  }
}
