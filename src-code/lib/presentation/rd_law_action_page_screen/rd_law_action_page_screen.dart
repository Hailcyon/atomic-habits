import 'bloc/rd_law_action_page_bloc.dart';
import 'models/rd_law_action_page_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class RdLawActionPageScreen extends StatelessWidget {
  const RdLawActionPageScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RdLawActionPageBloc>(
        create: (context) => RdLawActionPageBloc(RdLawActionPageState(
            rdLawActionPageModelObj: RdLawActionPageModel()))
          ..add(RdLawActionPageInitialEvent()),
        child: RdLawActionPageScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<RdLawActionPageBloc, RdLawActionPageState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.h, vertical: 27.v),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.only(left: 30.h, right: 36.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("msg_environment_priming".tr,
                                  style: CustomTextStyles.headlineMediumBold),
                              CustomImageView(
                                  imagePath: ImageConstant.imgInfo,
                                  height: 31.adaptSize,
                                  width: 31.adaptSize,
                                  margin: EdgeInsets.only(left: 5.h))
                            ])),
                    SizedBox(height: 31.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 315.h,
                            margin: EdgeInsets.only(left: 35.h, right: 57.h),
                            child: Text("msg_i_will_make_going".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.headlineLargeRegular))),
                    SizedBox(height: 25.v),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 35.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 109.h, vertical: 20.v),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder5,
                            image: DecorationImage(
                                image: fs.Svg(ImageConstant.imgGroup9),
                                fit: BoxFit.cover)),
                        child: Text("lbl_enter_text".tr,
                            style: CustomTextStyles.titleLargeMontserratBold)),
                    SizedBox(height: 56.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 35.h),
                            child: Text("lbl_suggestions".tr,
                                style:
                                    CustomTextStyles.titleLargeMontserrat_2))),
                    SizedBox(height: 23.v),
                    Container(
                        width: 337.h,
                        margin: EdgeInsets.symmetric(horizontal: 35.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 9.h, vertical: 7.v),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder5,
                            image: DecorationImage(
                                image: fs.Svg(ImageConstant.imgGroup9),
                                fit: BoxFit.cover)),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 1.v),
                              Container(
                                  width: 251.h,
                                  margin: EdgeInsets.only(right: 67.h),
                                  child: Text("msg_laying_out_my_running".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles
                                          .titleLargeMontserrat_2))
                            ])),
                    SizedBox(height: 25.v),
                    Container(
                        width: 337.h,
                        margin: EdgeInsets.symmetric(horizontal: 35.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 9.h, vertical: 4.v),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder5,
                            image: DecorationImage(
                                image: fs.Svg(ImageConstant.imgGroup9),
                                fit: BoxFit.cover)),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 3.v),
                              Container(
                                  width: 305.h,
                                  margin: EdgeInsets.only(right: 13.h),
                                  child: Text("msg_set_alarm_on_phone".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles
                                          .titleLargeMontserrat_2))
                            ])),
                    SizedBox(height: 23.v),
                    CustomElevatedButton(
                        text: "lbl_save".tr,
                        buttonTextStyle: theme.textTheme.displaySmall!),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 78.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBackButton,
            margin: EdgeInsets.only(left: 33.h, top: 7.v, bottom: 6.v),
            onTap: () {
              onTapBackButton(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_law_action".tr));
  }

  /// Navigates to the homePageContainerScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainerScreen,
    );
  }
}
