import 'bloc/make_it_obvious_one_bloc.dart';
import 'models/make_it_obvious_one_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MakeItObviousOneScreen extends StatelessWidget {
  const MakeItObviousOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MakeItObviousOneBloc>(
        create: (context) => MakeItObviousOneBloc(MakeItObviousOneState(
            makeItObviousOneModelObj: MakeItObviousOneModel()))
          ..add(MakeItObviousOneInitialEvent()),
        child: MakeItObviousOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<MakeItObviousOneBloc, MakeItObviousOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 26.h, vertical: 21.v),
                  child: Column(children: [
                    _buildEnvPriming(context),
                    SizedBox(height: 26.v),
                    _buildEnvDesign(context,
                        environmentDesign: "lbl_habit_stacking".tr),
                    SizedBox(height: 26.v),
                    _buildEnvDesign(context,
                        environmentDesign: "msg_environment_design".tr),
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
        title: AppbarSubtitleTwo(text: "lbl_make_it_obvious".tr));
  }

  /// Section Widget
  Widget _buildEnvPriming(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapEnvPriming(context);
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 221.h,
                  child: Text("msg_implementation_intention".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.headlineMediumBlack90001_1)),
              CustomImageView(
                  imagePath: ImageConstant.imgVector,
                  height: 22.v,
                  width: 33.h,
                  margin: EdgeInsets.only(left: 121.h, top: 9.v, bottom: 34.v))
            ]));
  }

  /// Common widget
  Widget _buildEnvDesign(
    BuildContext context, {
    required String environmentDesign,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Text(environmentDesign,
                  style: CustomTextStyles.headlineMediumBlack90001_1
                      .copyWith(color: appTheme.black90001))),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 23.v,
              width: 32.h,
              margin: EdgeInsets.only(left: 63.h, top: 10.v))
        ]);
  }

  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageTwoScreen,
    );
  }

  /// Navigates to the makeItObviousTwoScreen when the action is triggered.
  onTapEnvPriming(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItObviousTwoScreen,
    );
  }
}
