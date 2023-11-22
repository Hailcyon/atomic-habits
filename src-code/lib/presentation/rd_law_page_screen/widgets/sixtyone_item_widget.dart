import '../models/sixtyone_item_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SixtyoneItemWidget extends StatelessWidget {
  SixtyoneItemWidget(
    this.sixtyoneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SixtyoneItemModel sixtyoneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.v,
      width: 360.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              sixtyoneItemModelObj.reduceFriction!,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgVector,
            height: 16.v,
            width: 25.h,
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(bottom: 3.v),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 33.v,
              width: 360.h,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      sixtyoneItemModelObj.reduceFriction1!,
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 16.v,
                    width: 25.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(bottom: 3.v),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sixtyoneItemModelObj.reduceFriction2!,
                          style: theme.textTheme.headlineMedium,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVector,
                          height: 16.v,
                          width: 25.h,
                          margin: EdgeInsets.only(
                            top: 12.v,
                            bottom: 3.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
