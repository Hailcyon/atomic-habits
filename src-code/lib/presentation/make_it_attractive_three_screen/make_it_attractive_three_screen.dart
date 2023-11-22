import 'bloc/make_it_attractive_three_bloc.dart';
import 'models/make_it_attractive_three_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class MakeItAttractiveThreeScreen extends StatelessWidget {
  const MakeItAttractiveThreeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MakeItAttractiveThreeBloc>(
        create: (context) => MakeItAttractiveThreeBloc(
            MakeItAttractiveThreeState(
                makeItAttractiveThreeModelObj: MakeItAttractiveThreeModel()))
          ..add(MakeItAttractiveThreeInitialEvent()),
        child: MakeItAttractiveThreeScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<MakeItAttractiveThreeBloc, MakeItAttractiveThreeState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 27.h, vertical: 24.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              onTapTxtIWillGoForA(context);
                            },
                            child: Text("msg_i_will_go_for_a".tr,
                                style: theme.textTheme.headlineMedium)),
                        SizedBox(height: 26.v),
                        GestureDetector(
                            onTap: () {
                              onTapTxtAnd(context);
                            },
                            child: Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Text("lbl_and".tr,
                                    style: theme.textTheme.headlineMedium))),
                        SizedBox(height: 19.v),
                        Container(
                            height: 46.v,
                            width: 328.h,
                            margin: EdgeInsets.only(left: 12.h),
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgName,
                                      height: 46.v,
                                      width: 328.h,
                                      radius: BorderRadius.circular(5.h),
                                      alignment: Alignment.center),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Opacity(
                                          opacity: 0.5,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5.v),
                                              child: Text(
                                                  "msg_listen_to_a_podcast".tr,
                                                  style: CustomTextStyles
                                                      .titleLargeMontserratBlack900))))
                                ])),
                        SizedBox(height: 54.v),
                        GestureDetector(
                            onTap: () {
                              onTapTxtSuggestions(context);
                            },
                            child: Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Text("lbl_suggestions".tr,
                                    style: theme.textTheme.headlineMedium))),
                        SizedBox(height: 26.v),
                        CustomElevatedButton(
                            height: 46.v,
                            text: "lbl_watch_netflix".tr,
                            margin: EdgeInsets.only(left: 12.h, right: 36.h),
                            rightIcon: Container(
                                margin: EdgeInsets.only(),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.h)),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgName,
                                    height: 46.v,
                                    width: 328.h)),
                            buttonStyle: CustomButtonStyles.fillGray,
                            buttonTextStyle:
                                CustomTextStyles.titleLargeMontserratBlack900),
                        SizedBox(height: 44.v),
                        CustomElevatedButton(
                            height: 46.v,
                            text: "lbl_listen_to_music".tr,
                            margin: EdgeInsets.only(left: 12.h, right: 36.h),
                            rightIcon: Container(
                                margin: EdgeInsets.only(),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.h)),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgName,
                                    height: 46.v,
                                    width: 328.h)),
                            buttonStyle: CustomButtonStyles.fillGray,
                            buttonTextStyle:
                                CustomTextStyles.titleLargeMontserratBlack900),
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
        title: AppbarSubtitleTwo(text: "lbl_law_action".tr));
  }

  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageTwoScreen,
    );
  }

  /// Navigates to the makeItAttractiveOneScreen when the action is triggered.
  onTapTxtIWillGoForA(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItAttractiveOneScreen,
    );
  }

  /// Navigates to the makeItAttractiveOneScreen when the action is triggered.
  onTapTxtAnd(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItAttractiveOneScreen,
    );
  }

  /// Navigates to the makeItAttractiveOneScreen when the action is triggered.
  onTapTxtSuggestions(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItAttractiveOneScreen,
    );
  }
}
