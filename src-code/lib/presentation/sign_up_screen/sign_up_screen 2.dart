import 'bloc/sign_up_bloc.dart';
import 'models/sign_up_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/core/utils/validation_functions.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) =>
            SignUpBloc(SignUpState(signUpModelObj: SignUpModel()))
              ..add(SignUpInitialEvent()),
        child: SignUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 39.h, vertical: 30.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 185.h,
                              margin: EdgeInsets.only(left: 75.h),
                              child: Text("lbl_atomic_habits".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style:
                                      CustomTextStyles.displayMediumPrimary)),
                          SizedBox(height: 29.v),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: 283.v,
                                  width: 284.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              fs.Svg(ImageConstant.imgGroup18),
                                          fit: BoxFit.cover)),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgGroup18,
                                      height: 283.v,
                                      width: 284.h,
                                      alignment: Alignment.center))),
                          SizedBox(height: 48.v),
                          Container(
                              width: 337.h,
                              margin: EdgeInsets.only(right: 15.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 131.h, vertical: 20.v),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5,
                                  image: DecorationImage(
                                      image: fs.Svg(ImageConstant.imgName),
                                      fit: BoxFit.cover)),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 2.v),
                                    Opacity(
                                        opacity: 0.5,
                                        child: Text("lbl_name".tr,
                                            style: CustomTextStyles
                                                .titleLargeMontserratBlack90001))
                                  ])),
                          SizedBox(height: 9.v),
                          Container(
                              margin: EdgeInsets.only(right: 15.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 134.h, vertical: 21.v),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5,
                                  image: DecorationImage(
                                      image: fs.Svg(ImageConstant.imgName),
                                      fit: BoxFit.cover)),
                              child: Opacity(
                                  opacity: 0.5,
                                  child: Text("lbl_email".tr,
                                      style: CustomTextStyles
                                          .titleLargeMontserratBlack90001))),
                          SizedBox(height: 9.v),
                          Padding(
                              padding: EdgeInsets.only(right: 15.h),
                              child: BlocBuilder<SignUpBloc, SignUpState>(
                                  builder: (context, state) {
                                return CustomTextFormField(
                                    controller: state.passwordController,
                                    hintText: "lbl_password".tr,
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    suffix: InkWell(
                                        onTap: () {
                                          context.read<SignUpBloc>().add(
                                              ChangePasswordVisibilityEvent(
                                                  value:
                                                      !state.isShowPassword));
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.h)),
                                            child: CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgName,
                                                height: 70.v,
                                                width: 337.h))),
                                    suffixConstraints:
                                        BoxConstraints(maxHeight: 70.v),
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidPassword(value,
                                              isRequired: true))) {
                                        return "err_msg_please_enter_valid_password"
                                            .tr;
                                      }
                                      return null;
                                    },
                                    obscureText: state.isShowPassword,
                                    contentPadding: EdgeInsets.only(
                                        left: 30.h, top: 19.v, bottom: 19.v),
                                    borderDecoration:
                                        TextFormFieldStyleHelper.fillGray,
                                    fillColor: appTheme.gray300);
                              })),
                          SizedBox(height: 33.v),
                          CustomElevatedButton(
                              height: 67.v,
                              text: "lbl_sign_up".tr,
                              margin: EdgeInsets.only(right: 11.h),
                              buttonTextStyle:
                                  CustomTextStyles.headlineLargeLightgreen100,
                              onPressed: () {
                                onTapSignUp(context);
                              }),
                          SizedBox(height: 5.v)
                        ])))));
  }

  /// Navigates to the homePageContainer1Screen when the action is triggered.
  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainer1Screen,
    );
  }
}
