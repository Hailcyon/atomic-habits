import 'bloc/make_it_easy_three_bloc.dart';
import 'models/make_it_easy_three_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MakeItEasyThreeScreen extends StatelessWidget {
  const MakeItEasyThreeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MakeItEasyThreeBloc>(
        create: (context) => MakeItEasyThreeBloc(
            MakeItEasyThreeState(
                makeItEasyThreeModelObj: MakeItEasyThreeModel()))
          ..add(MakeItEasyThreeInitialEvent()),
        child: MakeItEasyThreeScreen());
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(height: 12.v),
                      Text("msg_what_is_your_habit".tr,
                          style:
                              CustomTextStyles.titleLargeMontserratGray9000220),
                      SizedBox(height: 2.v),
                      _buildRun(context),
                      SizedBox(height: 27.v),
                      Text("msg_when_is_your_habit".tr,
                          style:
                              CustomTextStyles.titleLargeMontserratGray9000220),
                      SizedBox(height: 2.v),
                      _buildTime(context),
                      SizedBox(height: 27.v),
                      Text("msg_where_is_your_habit".tr,
                          style:
                              CustomTextStyles.titleLargeMontserratGray9000220),
                      SizedBox(height: 3.v),
                      _buildLibertypark(context),
                      SizedBox(height: 12.v),
                      Container(
                          width: 285.h,
                          margin: EdgeInsets.only(right: 51.h),
                          child: Text("msg_i_will_run_at_7".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles
                                  .titleLargeMontserratGray90002))
                    ])),
            bottomNavigationBar: _buildSave(context)));
  }

  /// Section Widget
  Widget _buildRun(BuildContext context) {
    return BlocSelector<MakeItEasyThreeBloc, MakeItEasyThreeState,
            TextEditingController?>(
        selector: (state) => state.runController,
        builder: (context, runController) {
          return CustomTextFormField(
              controller: runController, hintText: "lbl_run".tr);
        });
  }

  /// Section Widget
  Widget _buildTime(BuildContext context) {
    return BlocSelector<MakeItEasyThreeBloc, MakeItEasyThreeState,
            TextEditingController?>(
        selector: (state) => state.timeController,
        builder: (context, timeController) {
          return CustomTextFormField(
              controller: timeController, hintText: "lbl_7_am".tr);
        });
  }

  /// Section Widget
  Widget _buildLibertypark(BuildContext context) {
    return BlocSelector<MakeItEasyThreeBloc, MakeItEasyThreeState,
            TextEditingController?>(
        selector: (state) => state.libertyparkController,
        builder: (context, libertyparkController) {
          return CustomTextFormField(
              controller: libertyparkController,
              hintText: "lbl_liberty_park".tr,
              textInputAction: TextInputAction.done);
        });
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
        height: 54.v,
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 18.h, right: 16.h, bottom: 21.v),
        buttonTextStyle: theme.textTheme.displaySmall!,
        onPressed: () {
          onTapSave(context);
        });
  }

  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItEasyTwoScreen,
    );
  }
}
