import 'bloc/make_it_attractive_one_bloc.dart';
import 'models/make_it_attractive_one_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MakeItAttractiveOneScreen extends StatelessWidget {
  const MakeItAttractiveOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MakeItAttractiveOneBloc>(
        create: (context) => MakeItAttractiveOneBloc(MakeItAttractiveOneState(
            makeItAttractiveOneModelObj: MakeItAttractiveOneModel()))
          ..add(MakeItAttractiveOneInitialEvent()),
        child: MakeItAttractiveOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<MakeItAttractiveOneBloc, MakeItAttractiveOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 27.h, vertical: 24.v),
                  child: Column(children: [
                    _buildEnvPriming(context),
                    SizedBox(height: 29.v),
                    _buildEnvDesign(context),
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
        title: AppbarSubtitleTwo(text: "msg_make_it_attractive".tr));
  }

  /// Section Widget
  Widget _buildEnvPriming(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapEnvPriming(context);
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("msg_temptation_bundling".tr,
              style: CustomTextStyles.headlineMediumBlack90001_1),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 22.v,
              width: 33.h,
              margin: EdgeInsets.only(left: 52.h, top: 6.v, bottom: 3.v))
        ]));
  }

  /// Section Widget
  Widget _buildEnvDesign(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: Text("msg_motivation_ritual".tr,
                  style: CustomTextStyles.headlineMediumBlack90001_1)),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 23.v,
              width: 32.h,
              margin: EdgeInsets.only(top: 13.v))
        ]);
  }

  /// Navigates to the editAHabitPageTwoScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageTwoScreen,
    );
  }

  /// Navigates to the makeItAttractiveTwoScreen when the action is triggered.
  onTapEnvPriming(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.makeItAttractiveTwoScreen,
    );
  }
}
