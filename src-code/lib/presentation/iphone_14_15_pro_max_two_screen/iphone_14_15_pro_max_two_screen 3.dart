import 'bloc/iphone_14_15_pro_max_two_bloc.dart';
import 'models/iphone_14_15_pro_max_two_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class Iphone1415ProMaxTwoScreen extends StatelessWidget {
  const Iphone1415ProMaxTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<Iphone1415ProMaxTwoBloc>(
        create: (context) => Iphone1415ProMaxTwoBloc(Iphone1415ProMaxTwoState(
            iphone1415ProMaxTwoModelObj: Iphone1415ProMaxTwoModel()))
          ..add(Iphone1415ProMaxTwoInitialEvent()),
        child: Iphone1415ProMaxTwoScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<Iphone1415ProMaxTwoBloc, Iphone1415ProMaxTwoState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.h, vertical: 24.v),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: _buildMakeItAttractive(context,
                            userName: "lbl_make_it_obvious".tr,
                            onTapMakeItAttractive: () {
                          onTapMakeItObvious(context);
                        })),
                    SizedBox(height: 17.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: _buildMakeItAttractive(context,
                            userName: "msg_make_it_attractive".tr,
                            onTapMakeItAttractive: () {
                          onTapMakeItAttractive(context);
                        })),
                    SizedBox(height: 12.v),
                    CustomElevatedButton(
                        text: "lbl".tr,
                        buttonTextStyle: theme.textTheme.displayMedium!,
                        onPressed: () {
                          onTaptf(context);
                        }),
                    SizedBox(height: 20.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: _buildMakeItAttractive(context,
                            userName: "lbl_make_it_easy".tr,
                            onTapMakeItAttractive: () {
                          onTapMakeItEasy(context);
                        })),
                    SizedBox(height: 16.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: _buildMakeItAttractive(context,
                            userName: "msg_make_it_satisfying".tr)),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 67.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBackButton,
            margin: EdgeInsets.only(left: 22.h, top: 11.v, bottom: 3.v),
            onTap: () {
              onTapBackButton(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_go_for_a_run3".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgEdit,
              margin: EdgeInsets.symmetric(horizontal: 22.h, vertical: 3.v))
        ]);
  }

  /// Common widget
  Widget _buildMakeItAttractive(
    BuildContext context, {
    required String userName,
    Function? onTapMakeItAttractive,
  }) {
    return GestureDetector(
        onTap: () {
          onTapMakeItAttractive!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(userName,
              style: CustomTextStyles.headlineMediumBold
                  .copyWith(color: appTheme.gray90002)),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 15.v,
              width: 25.h,
              margin: EdgeInsets.only(top: 9.v, bottom: 7.v))
        ]));
  }

  /// Navigates to the homePageContainer1Screen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainer1Screen,
    );
  }

  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapMakeItObvious(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageTwoScreen,
    );
  }

  /// Navigates to the editAHabitPageScreen when the action is triggered.
  onTapMakeItAttractive(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageScreen,
    );
  }

  /// Navigates to the makeItAttractiveOneScreen when the action is triggered.
  onTaptf(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItAttractiveOneScreen,
    );
  }

  /// Navigates to the editAHabitPageThreeScreen when the action is triggered.
  onTapMakeItEasy(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageThreeScreen,
    );
  }
}
