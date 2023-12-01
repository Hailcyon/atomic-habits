import '../iphone_14_15_pro_max_one_screen/widgets/reducefriction_item_widget.dart';
import 'bloc/iphone_14_15_pro_max_one_bloc.dart';
import 'models/iphone_14_15_pro_max_one_model.dart';
import 'models/reducefriction_item_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_subtitle.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Iphone1415ProMaxOneScreen extends StatelessWidget {
  const Iphone1415ProMaxOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<Iphone1415ProMaxOneBloc>(
        create: (context) => Iphone1415ProMaxOneBloc(Iphone1415ProMaxOneState(
            iphone1415ProMaxOneModelObj: Iphone1415ProMaxOneModel()))
          ..add(Iphone1415ProMaxOneInitialEvent()),
        child: Iphone1415ProMaxOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 21.v),
                child: Column(children: [
                  _buildReduceFriction(context),
                  SizedBox(height: 40.v),
                  _buildTwentySix(context),
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
  Widget _buildReduceFriction(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h, right: 5.h),
        child: BlocSelector<Iphone1415ProMaxOneBloc, Iphone1415ProMaxOneState,
                Iphone1415ProMaxOneModel?>(
            selector: (state) => state.iphone1415ProMaxOneModelObj,
            builder: (context, iphone1415ProMaxOneModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 42.v);
                  },
                  itemCount: iphone1415ProMaxOneModelObj
                          ?.reducefrictionItemList.length ??
                      0,
                  itemBuilder: (context, index) {
                    ReducefrictionItemModel model = iphone1415ProMaxOneModelObj
                            ?.reducefrictionItemList[index] ??
                        ReducefrictionItemModel();
                    return ReducefrictionItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildTwentySix(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("msg_environment_priming".tr,
              style: CustomTextStyles.headlineMediumBlack90001_1),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 16.v,
              width: 25.h,
              margin: EdgeInsets.only(left: 42.h, top: 6.v, bottom: 9.v))
        ]);
  }

  /// Navigates to the editAHabitPageThreeScreen when the action is triggered.
  onTapImgBackButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageThreeScreen,
    );
  }
}
