// ignore_for_file: must_be_immutable

part of 'loading_bloc.dart';

/// Represents the state of Loading in the application.
class LoadingState extends Equatable {
  LoadingState({this.loadingModelObj});

  LoadingModel? loadingModelObj;

  @override
  List<Object?> get props => [
        loadingModelObj,
      ];
  LoadingState copyWith({LoadingModel? loadingModelObj}) {
    return LoadingState(
      loadingModelObj: loadingModelObj ?? this.loadingModelObj,
    );
  }
}
