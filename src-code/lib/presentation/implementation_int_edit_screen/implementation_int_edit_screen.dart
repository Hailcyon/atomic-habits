import 'bloc/implementation_int_edit_bloc.dart';
import 'models/implementation_int_edit_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ImplementationIntEditScreen extends StatelessWidget {
  const ImplementationIntEditScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ImplementationIntEditBloc>(
        create: (context) => ImplementationIntEditBloc(
            ImplementationIntEditState(
                implementationIntEditModelObj: ImplementationIntEditModel()))
          ..add(ImplementationIntEditInitialEvent()),
        child: ImplementationIntEditScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: 373.h,
                padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 9.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 12.v),
                      Text("msg_what_is_your_habit".tr,
                          style: CustomTextStyles
                              .titleLargeMontserratPrimaryContainer20),
                      SizedBox(height: 2.v),
                      _buildHabitName(context),
                      SizedBox(height: 27.v),
                      Text("msg_when_is_your_habit".tr,
                          style: CustomTextStyles
                              .titleLargeMontserratPrimaryContainer20),
                      SizedBox(height: 2.v),
                      _buildHabitTime(context),
                      SizedBox(height: 27.v),
                      Text("msg_where_is_your_habit".tr,
                          style: CustomTextStyles
                              .titleLargeMontserratPrimaryContainer20),
                      SizedBox(height: 3.v),
                      _buildHabitLocation(context),
                      SizedBox(height: 12.v),
                      Container(
                          width: 285.h,
                          margin: EdgeInsets.only(right: 51.h),
                          child: Text("msg_i_will_run_at_7".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles
                                  .titleLargeMontserratPrimaryContainer))
                    ])),
            bottomNavigationBar: _buildSaveButton(context)));
  }

  /// Section Widget
  Widget _buildHabitName(BuildContext context) {
    return BlocSelector<ImplementationIntEditBloc, ImplementationIntEditState,
            TextEditingController?>(
        selector: (state) => state.habitNameController,
        builder: (context, habitNameController) {
          return CustomTextFormField(
              controller: habitNameController, hintText: "lbl_run".tr);
        });
  }

  /// Section Widget
  Widget _buildHabitTime(BuildContext context) {
    return BlocSelector<ImplementationIntEditBloc, ImplementationIntEditState,
            TextEditingController?>(
        selector: (state) => state.habitTimeController,
        builder: (context, habitTimeController) {
          return CustomTextFormField(
              controller: habitTimeController, hintText: "lbl_7_am".tr);
        });
  }

  /// Section Widget
  Widget _buildHabitLocation(BuildContext context) {
    return BlocSelector<ImplementationIntEditBloc, ImplementationIntEditState,
            TextEditingController?>(
        selector: (state) => state.habitLocationController,
        builder: (context, habitLocationController) {
          return CustomTextFormField(
              controller: habitLocationController,
              hintText: "lbl_liberty_park".tr,
              textInputAction: TextInputAction.done);
        });
  }

  /// Section Widget
  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
        height: 54.v,
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 18.h, right: 16.h, bottom: 21.v),
        buttonTextStyle: theme.textTheme.displaySmall!,
        onPressed: () {
          onTapSaveButton(context);
        });
  }

  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapSaveButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageTwoScreen,
    );
  }
}
