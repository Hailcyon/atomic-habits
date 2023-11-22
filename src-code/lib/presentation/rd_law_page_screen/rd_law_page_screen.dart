import '../rd_law_page_screen/widgets/sixtyone_item_widget.dart';
import 'bloc/rd_law_page_bloc.dart';
import 'models/rd_law_page_model.dart';
import 'models/sixtyone_item_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class RdLawPageScreen extends StatelessWidget {
  const RdLawPageScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RdLawPageBloc>(
        create: (context) =>
            RdLawPageBloc(RdLawPageState(rdLawPageModelObj: RdLawPageModel()))
              ..add(RdLawPageInitialEvent()),
        child: RdLawPageScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 21.v),
                child: Column(children: [
                  _buildSixtyOne(context),
                  SizedBox(height: 35.v),
                  _buildSeven(context),
                  SizedBox(height: 25.v),
                  CustomElevatedButton(
                      text: "lbl".tr,
                      buttonTextStyle: theme.textTheme.displayMedium!,
                      onPressed: () {
                        onTaptf(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 78.h,
        leading: Container(
            height: 42.v,
            width: 45.h,
            margin: EdgeInsets.only(left: 33.h, top: 7.v, bottom: 6.v),
            child: Stack(children: [
              CustomImageView(
                  imagePath: ImageConstant.imgBackButton,
                  height: 42.v,
                  width: 45.h,
                  alignment: Alignment.center,
                  onTap: () {
                    onTapImgBackButton(context);
                  }),
              SizedBox(
                  height: 42.v,
                  width: 45.h,
                  child: Stack(alignment: Alignment.center, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgBackButton,
                        height: 42.v,
                        width: 45.h,
                        alignment: Alignment.center),
                    CustomImageView(
                        imagePath: ImageConstant.imgBackButton,
                        height: 42.v,
                        width: 45.h,
                        alignment: Alignment.center)
                  ]))
            ])),
        centerTitle: true,
        title: SizedBox(
            height: 38.v,
            width: 207.h,
            child: Stack(alignment: Alignment.center, children: [
              AppbarSubtitle(text: "lbl_make_it_easy".tr),
              AppbarSubtitle(text: "lbl_make_it_easy".tr),
              AppbarSubtitle(text: "lbl_make_it_easy".tr)
            ])));
  }

  /// Section Widget
  Widget _buildSixtyOne(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 22.h, right: 25.h),
        child: BlocSelector<RdLawPageBloc, RdLawPageState, RdLawPageModel?>(
            selector: (state) => state.rdLawPageModelObj,
            builder: (context, rdLawPageModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 42.v);
                  },
                  itemCount: rdLawPageModelObj?.sixtyoneItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    SixtyoneItemModel model =
                        rdLawPageModelObj?.sixtyoneItemList[index] ??
                            SixtyoneItemModel();
                    return SixtyoneItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return SizedBox(
        height: 54.v,
        width: 369.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 369.h,
                  child: Text("msg_decrease_steps_between".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeMontserrat_1))),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 54.v,
                  width: 369.h,
                  child: Stack(alignment: Alignment.center, children: [
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: 369.h,
                            child: Text("msg_decrease_steps_between".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    CustomTextStyles.titleLargeMontserrat_1))),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: 369.h,
                            child: Text("msg_decrease_steps_between".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    CustomTextStyles.titleLargeMontserrat_1)))
                  ])))
        ]));
  }

  /// Navigates to the homePageContainerScreen when the action is triggered.
  onTapImgBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainerScreen,
    );
  }

  /// Navigates to the environmentPrimingScreen when the action is triggered.
  onTaptf(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.environmentPrimingScreen,
    );
  }
}
