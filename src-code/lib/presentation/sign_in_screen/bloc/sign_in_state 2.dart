// ignore_for_file: must_be_immutable

part of 'sign_in_bloc.dart';

/// Represents the state of SignIn in the application.
class SignInState extends Equatable {
  SignInState({
    this.passwordController,
    this.isShowPassword = true,
    this.signInModelObj,
  });

  TextEditingController? passwordController;

  SignInModel? signInModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        passwordController,
        isShowPassword,
        signInModelObj,
      ];
  SignInState copyWith({
    TextEditingController? passwordController,
    bool? isShowPassword,
    SignInModel? signInModelObj,
  }) {
    return SignInState(
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signInModelObj: signInModelObj ?? this.signInModelObj,
    );
  }
}
