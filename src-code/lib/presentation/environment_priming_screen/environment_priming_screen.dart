import 'bloc/environment_priming_bloc.dart';
import 'models/environment_priming_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class EnvironmentPrimingScreen extends StatelessWidget {
  const EnvironmentPrimingScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EnvironmentPrimingBloc>(
        create: (context) => EnvironmentPrimingBloc(EnvironmentPrimingState(
            environmentPrimingModelObj: EnvironmentPrimingModel()))
          ..add(EnvironmentPrimingInitialEvent()),
        child: EnvironmentPrimingScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: 373.h,
                padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 20.v),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: 325.h,
                              margin: EdgeInsets.only(right: 11.h),
                              child: Text("msg_i_will_make_going2".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .titleLargeMontserratPrimaryContainer20))),
                      SizedBox(height: 3.v),
                      BlocSelector<EnvironmentPrimingBloc,
                              EnvironmentPrimingState, TextEditingController?>(
                          selector: (state) => state.editTextController,
                          builder: (context, editTextController) {
                            return CustomTextFormField(
                                controller: editTextController,
                                textInputAction: TextInputAction.done);
                          }),
                      SizedBox(height: 26.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 11.h),
                              child: Text("lbl_suggestions".tr,
                                  style: CustomTextStyles
                                      .titleLargeMontserrat_2))),
                      SizedBox(height: 14.v),
                      _buildEnvironmentPrimingEleven(context),
                      SizedBox(height: 16.v),
                      _buildEnvironmentPrimingTwelve(context)
                    ])),
            bottomNavigationBar: _buildSixtyFourSave(context)));
  }

  /// Section Widget
  Widget _buildEnvironmentPrimingEleven(BuildContext context) {
    return Container(
        width: 330.h,
        margin: EdgeInsets.only(right: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.v),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusStyle.roundedBorder5,
            image: DecorationImage(
                image: fs.Svg(ImageConstant.imgGroup11), fit: BoxFit.cover)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1.v),
              Container(
                  width: 251.h,
                  margin: EdgeInsets.only(right: 60.h),
                  child: Text("msg_laying_out_my_running".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeMontserrat_2))
            ]));
  }

  /// Section Widget
  Widget _buildEnvironmentPrimingTwelve(BuildContext context) {
    return Container(
        width: 330.h,
        margin: EdgeInsets.only(right: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 1.v),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusStyle.roundedBorder5,
            image: DecorationImage(
                image: fs.Svg(ImageConstant.imgGroup12), fit: BoxFit.cover)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 5.v),
              Container(
                  width: 305.h,
                  margin: EdgeInsets.only(right: 7.h),
                  child: Text("msg_set_alarm_on_phone".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeMontserrat_2))
            ]));
  }

  /// Section Widget
  Widget _buildSixtyFourSave(BuildContext context) {
    return CustomElevatedButton(
        height: 52.v,
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 18.h, right: 16.h, bottom: 23.v),
        buttonTextStyle: theme.textTheme.displaySmall!,
        onPressed: () {
          onTapSixtyFourSave(context);
        });
  }

  /// Navigates to the rdLawPageScreen when the action is triggered.
  onTapSixtyFourSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.rdLawPageScreen,
    );
  }
}
