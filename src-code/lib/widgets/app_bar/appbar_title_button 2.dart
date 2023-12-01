import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTitleButton extends StatelessWidget {
  AppbarTitleButton({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomElevatedButton(
          height: 44.v,
          width: 92.h,
          text: "lbl_april".tr,
          rightIcon: Container(
            margin: EdgeInsets.only(left: 2.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowsDropDownDown,
              height: 24.v,
              width: 8.h,
            ),
          ),
          buttonStyle: CustomButtonStyles.outlineOnPrimary,
          buttonTextStyle: theme.textTheme.headlineSmall!,
        ),
      ),
    );
  }
}
