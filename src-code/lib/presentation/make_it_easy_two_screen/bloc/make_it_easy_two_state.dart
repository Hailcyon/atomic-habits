// ignore_for_file: must_be_immutable

part of 'make_it_easy_two_bloc.dart';

// import 'package:equatable/equatable.dart';

/// Represents the state of MakeItEasyiveOne in the application.
class MakeItEasyTwoState extends Equatable {
  MakeItEasyTwoState({this.makeItEasyTwoModelObj});

  MakeItEasyTwoModel? makeItEasyTwoModelObj;

  @override
  List<Object?> get props => [
        makeItEasyTwoModelObj,
      ];
  MakeItEasyTwoState copyWith(
      {MakeItEasyTwoModel? makeItEasyTwoModelObj}) {
    return MakeItEasyTwoState(
      makeItEasyTwoModelObj:
          makeItEasyTwoModelObj ?? this.makeItEasyTwoModelObj,
    );
  }
}
