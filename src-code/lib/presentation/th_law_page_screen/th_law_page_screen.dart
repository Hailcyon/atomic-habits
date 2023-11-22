import 'bloc/th_law_page_bloc.dart';
import 'models/th_law_page_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ThLawPageScreen extends StatelessWidget {
  const ThLawPageScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ThLawPageBloc>(
        create: (context) =>
            ThLawPageBloc(ThLawPageState(thLawPageModelObj: ThLawPageModel()))
              ..add(ThLawPageInitialEvent()),
        child: ThLawPageScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<ThLawPageBloc, ThLawPageState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.h, vertical: 23.v),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 21.h),
                        child: _buildSeven(context,
                            habitTrackerText: "lbl_reinforcement".tr)),
                    SizedBox(height: 29.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 348.h,
                            margin: EdgeInsets.only(left: 22.h, right: 38.h),
                            child: Text("msg_give_yourself_an".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    CustomTextStyles.titleLargeMontserrat_1))),
                    SizedBox(height: 28.v),
                    CustomElevatedButton(
                        text: "lbl".tr,
                        buttonTextStyle: theme.textTheme.displayMedium!),
                    SizedBox(height: 46.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 21.h),
                        child: _buildSeven(context,
                            habitTrackerText: "msg_use_a_habit_tracker".tr)),
                    SizedBox(height: 29.v),
                    CustomElevatedButton(
                        text: "msg_click_to_view_statistics".tr,
                        buttonTextStyle:
                            CustomTextStyles.titleLargeMontserratAmber200),
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
            margin: EdgeInsets.only(left: 33.h, top: 7.v, bottom: 7.v),
            onTap: () {
              onTapBackButton(context);
            }),
        title: AppbarSubtitle(
            text: "msg_make_it_satisfying".tr,
            margin: EdgeInsets.only(left: 6.h)));
  }

  /// Common widget
  Widget _buildSeven(
    BuildContext context, {
    required String habitTrackerText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(habitTrackerText,
          style: CustomTextStyles.headlineMediumBold
              .copyWith(color: appTheme.black900)),
      CustomImageView(
          imagePath: ImageConstant.imgVectorBlack90015x25,
          height: 15.v,
          width: 25.h,
          margin: EdgeInsets.only(left: 64.h, top: 11.v, bottom: 5.v))
    ]);
  }

  /// Navigates to the homePageContainerScreen when the action is triggered.
  onTapBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainerScreen,
    );
  }
}
