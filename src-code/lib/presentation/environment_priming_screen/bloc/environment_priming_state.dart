// ignore_for_file: must_be_immutable

part of 'environment_priming_bloc.dart';

/// Represents the state of EnvironmentPriming in the application.
class EnvironmentPrimingState extends Equatable {
  EnvironmentPrimingState({
    this.editTextController,
    this.environmentPrimingModelObj,
  });

  TextEditingController? editTextController;

  EnvironmentPrimingModel? environmentPrimingModelObj;

  @override
  List<Object?> get props => [
        editTextController,
        environmentPrimingModelObj,
      ];
  EnvironmentPrimingState copyWith({
    TextEditingController? editTextController,
    EnvironmentPrimingModel? environmentPrimingModelObj,
  }) {
    return EnvironmentPrimingState(
      editTextController: editTextController ?? this.editTextController,
      environmentPrimingModelObj:
          environmentPrimingModelObj ?? this.environmentPrimingModelObj,
    );
  }
}
