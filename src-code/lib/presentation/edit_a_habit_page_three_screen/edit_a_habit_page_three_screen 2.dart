import 'bloc/edit_a_habit_page_three_bloc.dart';
import 'models/edit_a_habit_page_three_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class EditAHabitPageThreeScreen extends StatelessWidget {
  const EditAHabitPageThreeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EditAHabitPageThreeBloc>(
        create: (context) => EditAHabitPageThreeBloc(EditAHabitPageThreeState(
            editAHabitPageThreeModelObj: EditAHabitPageThreeModel()))
          ..add(EditAHabitPageThreeInitialEvent()),
        child: EditAHabitPageThreeScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<EditAHabitPageThreeBloc, EditAHabitPageThreeState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 9.h, vertical: 23.v),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: _buildMakeItAttractive(context,
                            makeItAttractive: "lbl_make_it_obvious".tr,
                            vector: ImageConstant.imgVector,
                            onTapMakeItAttractive: () {
                          onTapMakeItObvious(context);
                        })),
                    SizedBox(height: 18.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: _buildMakeItAttractive(context,
                            makeItAttractive: "msg_make_it_attractive".tr,
                            vector: ImageConstant.imgVector,
                            onTapMakeItAttractive: () {
                          onTapMakeItAttractive(context);
                        })),
                    SizedBox(height: 27.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: _buildMakeItAttractive(context,
                            makeItAttractive: "lbl_make_it_easy".tr,
                            vector: ImageConstant.imgVectorBlack90015x25,
                            onTapMakeItAttractive: () {
                          onTapMakeItObvious1(context);
                        })),
                    SizedBox(height: 11.v),
                    CustomElevatedButton(
                        text: "lbl".tr,
                        buttonTextStyle: theme.textTheme.displayMedium!,
                        onPressed: () {
                          onTaptf(context);
                        }),
                    SizedBox(height: 22.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: _buildMakeItAttractive(context,
                            makeItAttractive: "msg_make_it_satisfying".tr,
                            vector: ImageConstant.imgVector)),
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
            margin: EdgeInsets.only(left: 16.h, top: 11.v, bottom: 3.v),
            onTap: () {
              onTapBackButton(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_go_for_a_run3".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgEdit,
              margin: EdgeInsets.symmetric(horizontal: 28.h, vertical: 3.v))
        ]);
  }

  /// Common widget
  Widget _buildMakeItAttractive(
    BuildContext context, {
    required String makeItAttractive,
    required String vector,
    Function? onTapMakeItAttractive,
  }) {
    return GestureDetector(
        onTap: () {
          onTapMakeItAttractive!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(makeItAttractive,
              style: theme.textTheme.headlineMedium!
                  .copyWith(color: appTheme.gray90002)),
          CustomImageView(
              imagePath: vector,
              height: 15.v,
              width: 25.h,
              margin: EdgeInsets.only(top: 9.v, bottom: 8.v))
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

  /// Navigates to the iphone1415ProMaxTwoScreen when the action is triggered.
  onTapMakeItAttractive(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.iphone1415ProMaxTwoScreen,
    );
  }

  /// Navigates to the editAHabitPageScreen when the action is triggered.
  onTapMakeItObvious1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageScreen,
    );
  }

  onTaptf(BuildContext context) {
    // TODO: implement Actions
  }
}
