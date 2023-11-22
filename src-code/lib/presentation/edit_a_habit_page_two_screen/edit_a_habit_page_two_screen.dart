import 'bloc/edit_a_habit_page_two_bloc.dart';
import 'models/edit_a_habit_page_two_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditAHabitPageTwoScreen extends StatelessWidget {
  const EditAHabitPageTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EditAHabitPageTwoBloc>(
        create: (context) => EditAHabitPageTwoBloc(EditAHabitPageTwoState(
            editAHabitPageTwoModelObj: EditAHabitPageTwoModel()))
          ..add(EditAHabitPageTwoInitialEvent()),
        child: EditAHabitPageTwoScreen());
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
                padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 23.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: _buildMakeItAttractive(context,
                          userName: "lbl_make_it_obvious".tr,
                          userImage: ImageConstant.imgVectorBlack90015x25,
                          onTapMakeItAttractive: () {
                        onTapMakeItObvious(context);
                      })),
                  SizedBox(height: 9.v),
                  BlocSelector<EditAHabitPageTwoBloc, EditAHabitPageTwoState,
                          TextEditingController?>(
                      selector: (state) => state.timeController,
                      builder: (context, timeController) {
                        return CustomTextFormField(
                            controller: timeController,
                            hintText: "msg_i_will_run_at_7".tr,
                            hintStyle: CustomTextStyles
                                .titleLargeMontserratPrimaryContainer,
                            textInputAction: TextInputAction.done,
                            suffix: Container(
                                margin:
                                    EdgeInsets.fromLTRB(30.h, 20.v, 19.h, 20.v),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgMorevert,
                                    height: 32.v,
                                    width: 8.h)),
                            suffixConstraints: BoxConstraints(maxHeight: 72.v),
                            contentPadding: EdgeInsets.only(
                                left: 10.h, top: 22.v, bottom: 22.v),
                            borderDecoration:
                                TextFormFieldStyleHelper.fillYellow,
                            fillColor: appTheme.yellow200);
                      }),
                  SizedBox(height: 19.v),
                  CustomElevatedButton(
                      text: "lbl".tr,
                      buttonTextStyle: theme.textTheme.displayMedium!,
                      onPressed: () {
                        onTaptf(context);
                      }),
                  SizedBox(height: 18.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: _buildMakeItAttractive(context,
                          userName: "msg_make_it_attractive".tr,
                          userImage: ImageConstant.imgVector)),
                  SizedBox(height: 24.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: _buildMakeItAttractive(context,
                          userName: "lbl_make_it_easy".tr,
                          userImage: ImageConstant.imgVector,
                          onTapMakeItAttractive: () {
                        onTapMakeItEasy(context);
                      })),
                  SizedBox(height: 19.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: _buildMakeItAttractive(context,
                          userName: "msg_make_it_satisfying".tr,
                          userImage: ImageConstant.imgVector)),
                  SizedBox(height: 5.v)
                ]))));
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
    required String userName,
    required String userImage,
    Function? onTapMakeItAttractive,
  }) {
    return GestureDetector(
        onTap: () {
          onTapMakeItAttractive!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(userName,
              style: CustomTextStyles.headlineMediumPrimaryContainer_1.copyWith(
                  color: theme.colorScheme.primaryContainer.withOpacity(1))),
          CustomImageView(
              imagePath: userImage,
              height: 15.v,
              width: 25.h,
              margin: EdgeInsets.only(top: 9.v, bottom: 8.v))
        ]));
  }

  /// Navigates to the homePageContainerScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainerScreen,
    );
  }

  /// Navigates to the editAHabitPageScreen when the action is triggered.
  onTapMakeItObvious(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageScreen,
    );
  }

  /// Navigates to the makeItObviousOneScreen when the action is triggered.
  onTaptf(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItObviousOneScreen,
    );
  }

  /// Navigates to the editAHabitPageThreeScreen when the action is triggered.
  onTapMakeItEasy(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageThreeScreen,
    );
  }
}
