import 'bloc/edit_a_habit_page_bloc.dart';
import 'models/edit_a_habit_page_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class EditAHabitPageScreen extends StatelessWidget {
  const EditAHabitPageScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EditAHabitPageBloc>(
        create: (context) => EditAHabitPageBloc(
            EditAHabitPageState(editAHabitPageModelObj: EditAHabitPageModel()))
          ..add(EditAHabitPageInitialEvent()),
        child: EditAHabitPageScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<EditAHabitPageBloc, EditAHabitPageState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 21.h, vertical: 23.v),
                  child: Column(children: [
                    _buildMakeItAttractive(context,
                        msg: "lbl_make_it_obvious".tr,
                        onTapMakeItAttractive: () {
                      onTapMakeItObvious(context);
                    }),
                    SizedBox(height: 18.v),
                    _buildMakeItAttractive(context,
                        msg: "msg_make_it_attractive".tr,
                        onTapMakeItAttractive: () {
                      onTapMakeItAttractive(context);
                    }),
                    SizedBox(height: 24.v),
                    _buildMakeItAttractive(context, msg: "lbl_make_it_easy".tr,
                        onTapMakeItAttractive: () {
                      onTapMakeItEasy(context);
                    }),
                    SizedBox(height: 19.v),
                    _buildMakeItAttractive(context,
                        msg: "msg_make_it_satisfying".tr),
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
    required String msg,
    Function? onTapMakeItAttractive,
  }) {
    return GestureDetector(
        onTap: () {
          onTapMakeItAttractive!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(msg,
              style: theme.textTheme.headlineMedium!
                  .copyWith(color: appTheme.gray90002)),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
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

  /// Navigates to the editAHabitPageThreeScreen when the action is triggered.
  onTapMakeItEasy(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageThreeScreen,
    );
  }
}
