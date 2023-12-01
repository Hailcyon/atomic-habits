import 'bloc/implementation_int_bloc.dart';
import 'models/implementation_int_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ImplementationIntScreen extends StatelessWidget {
  const ImplementationIntScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ImplementationIntBloc>(
        create: (context) => ImplementationIntBloc(ImplementationIntState(
            implementationIntModelObj: ImplementationIntModel()))
          ..add(ImplementationIntInitialEvent()),
        child: ImplementationIntScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: 373.h,
                padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 22.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("msg_what_is_your_habit".tr,
                          style:
                              CustomTextStyles.titleLargeMontserratGray9000220),
                      SizedBox(height: 2.v),
                      _buildHabitText(context),
                      SizedBox(height: 27.v),
                      Text("msg_when_is_your_habit".tr,
                          style:
                              CustomTextStyles.titleLargeMontserratGray9000220),
                      SizedBox(height: 2.v),
                      _buildHabitTimeText(context),
                      SizedBox(height: 27.v),
                      Text("msg_where_is_your_habit".tr,
                          style:
                              CustomTextStyles.titleLargeMontserratGray9000220),
                      SizedBox(height: 3.v),
                      _buildHabitLocationText(context),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildSaveButton(context)));
  }

  /// Section Widget
  Widget _buildHabitText(BuildContext context) {
    return BlocSelector<ImplementationIntBloc, ImplementationIntState,
            TextEditingController?>(
        selector: (state) => state.habitTextController,
        builder: (context, habitTextController) {
          return CustomTextFormField(controller: habitTextController);
        });
  }

  /// Section Widget
  Widget _buildHabitTimeText(BuildContext context) {
    return BlocSelector<ImplementationIntBloc, ImplementationIntState,
            TextEditingController?>(
        selector: (state) => state.habitTimeTextController,
        builder: (context, habitTimeTextController) {
          return CustomTextFormField(controller: habitTimeTextController);
        });
  }

  /// Section Widget
  Widget _buildHabitLocationText(BuildContext context) {
    return BlocSelector<ImplementationIntBloc, ImplementationIntState,
            TextEditingController?>(
        selector: (state) => state.habitLocationTextController,
        builder: (context, habitLocationTextController) {
          return CustomTextFormField(
              controller: habitLocationTextController,
              textInputAction: TextInputAction.done);
        });
  }

  /// Section Widget
  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
        height: 52.v,
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 18.h, right: 16.h, bottom: 23.v),
        buttonTextStyle: theme.textTheme.displaySmall!,
        onPressed: () {
          onTapSaveButton(context);
        });
  }

  /// Navigates to the makeItObviousTwoScreen when the action is triggered.
  onTapSaveButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItObviousTwoScreen,
    );
  }
}
