// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

/// Represents the state of SignUp in the application.
class SignUpState extends Equatable {
  SignUpState({
    this.passwordController,
    this.isShowPassword = true,
    this.signUpModelObj,
  });

  TextEditingController? passwordController;

  SignUpModel? signUpModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        passwordController,
        isShowPassword,
        signUpModelObj,
      ];
  SignUpState copyWith({
    TextEditingController? passwordController,
    bool? isShowPassword,
    SignUpModel? signUpModelObj,
  }) {
    return SignUpState(
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signUpModelObj: signUpModelObj ?? this.signUpModelObj,
    );
  }
}
