import 'bloc/sign_in_bloc.dart';
import 'models/sign_in_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/core/utils/validation_functions.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:ahapp3/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignInBloc>(
        create: (context) =>
            SignInBloc(SignInState(signInModelObj: SignInModel()))
              ..add(SignInInitialEvent()),
        child: SignInScreen());
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
                        EdgeInsets.symmetric(horizontal: 42.h, vertical: 29.v),
                    child: Column(children: [
                      SizedBox(height: 4.v),
                      SizedBox(
                          width: 185.h,
                          child: Text("lbl_atomic_habits".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.displayMediumPrimary)),
                      SizedBox(height: 29.v),
                      Container(
                          height: 283.v,
                          width: 284.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: fs.Svg(ImageConstant.imgGroup18),
                                  fit: BoxFit.cover)),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgGroup18,
                              height: 283.v,
                              width: 284.h,
                              alignment: Alignment.center)),
                      SizedBox(height: 77.v),
                      Container(
                          margin: EdgeInsets.only(left: 3.h, right: 4.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 135.h, vertical: 18.v),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                              image: DecorationImage(
                                  image: fs.Svg(ImageConstant.imgName),
                                  fit: BoxFit.cover)),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(height: 5.v),
                            Opacity(
                                opacity: 0.5,
                                child: Text("lbl_email".tr,
                                    style: CustomTextStyles
                                        .titleLargeMontserratBlack90001))
                          ])),
                      SizedBox(height: 30.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.h),
                          child: BlocBuilder<SignInBloc, SignInState>(
                              builder: (context, state) {
                            return CustomTextFormField(
                                controller: state.passwordController,
                                hintText: "lbl_password".tr,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      context.read<SignInBloc>().add(
                                          ChangePasswordVisibilityEvent(
                                              value: !state.isShowPassword));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.h)),
                                        child: CustomImageView(
                                            imagePath: ImageConstant.imgName,
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
                                    left: 30.h, top: 18.v, bottom: 18.v),
                                borderDecoration:
                                    TextFormFieldStyleHelper.fillGray,
                                fillColor: appTheme.gray300);
                          })),
                      SizedBox(height: 62.v),
                      CustomElevatedButton(
                          height: 67.v,
                          text: "lbl_login".tr,
                          buttonTextStyle:
                              CustomTextStyles.headlineLargeLightgreen100,
                          onPressed: () {
                            onTapLogin(context);
                          }),
                      SizedBox(height: 31.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtConfirmation(context);
                              },
                              child: Text("msg_don_t_have_an_account".tr,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .titleLargeMontserratPrimary
                                      .copyWith(
                                          decoration:
                                              TextDecoration.underline))))
                    ])))));
  }

  /// Navigates to the homePageContainer1Screen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageContainer1Screen,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtConfirmation(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpScreen,
    );
  }
}
