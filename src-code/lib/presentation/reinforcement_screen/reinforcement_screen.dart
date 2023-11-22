import 'bloc/reinforcement_bloc.dart';
import 'models/reinforcement_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class ReinforcementScreen extends StatelessWidget {
  const ReinforcementScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ReinforcementBloc>(
        create: (context) => ReinforcementBloc(
            ReinforcementState(reinforcementModelObj: ReinforcementModel()))
          ..add(ReinforcementInitialEvent()),
        child: ReinforcementScreen());
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
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("msg_after_going_for".tr,
                          style: CustomTextStyles
                              .titleLargeMontserratPrimaryContainer20)),
                  SizedBox(height: 2.v),
                  BlocSelector<ReinforcementBloc, ReinforcementState,
                          TextEditingController?>(
                      selector: (state) => state.editTextController,
                      builder: (context, editTextController) {
                        return CustomTextFormField(
                            controller: editTextController,
                            textInputAction: TextInputAction.done);
                      }),
                  SizedBox(height: 52.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          child: Text("lbl_suggestions".tr,
                              style: CustomTextStyles.titleLargeMontserrat_2))),
                  SizedBox(height: 14.v),
                  _buildElevenSection(context),
                  SizedBox(height: 16.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup12,
                      height: 66.v,
                      width: 330.h,
                      radius: BorderRadius.circular(5.h))
                ])),
            bottomNavigationBar: _buildSaveSection(context)));
  }

  /// Section Widget
  Widget _buildElevenSection(BuildContext context) {
    return Container(
        width: 330.h,
        margin: EdgeInsets.only(right: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 6.v),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusStyle.roundedBorder5,
            image: DecorationImage(
                image: fs.Svg(ImageConstant.imgGroup11), fit: BoxFit.cover)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.v),
              Text("lbl_watch_a_tv_show".tr,
                  style: CustomTextStyles.titleLargeMontserrat_2)
            ]));
  }

  /// Section Widget
  Widget _buildSaveSection(BuildContext context) {
    return CustomElevatedButton(
        height: 52.v,
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 18.h, right: 16.h, bottom: 23.v),
        buttonTextStyle: theme.textTheme.displaySmall!,
        onPressed: () {
          onTapSaveSection(context);
        });
  }

  /// Navigates to the rdLawPageScreen when the action is triggered.
  onTapSaveSection(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.rdLawPageScreen,
    );
  }
}
