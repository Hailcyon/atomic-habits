// ignore_for_file: must_be_immutable

part of 'iphone_14_15_pro_max_two_bloc.dart';

/// Represents the state of Iphone1415ProMaxTwo in the application.
class Iphone1415ProMaxTwoState extends Equatable {
  Iphone1415ProMaxTwoState({this.iphone1415ProMaxTwoModelObj});

  Iphone1415ProMaxTwoModel? iphone1415ProMaxTwoModelObj;

  @override
  List<Object?> get props => [
        iphone1415ProMaxTwoModelObj,
      ];
  Iphone1415ProMaxTwoState copyWith(
      {Iphone1415ProMaxTwoModel? iphone1415ProMaxTwoModelObj}) {
    return Iphone1415ProMaxTwoState(
      iphone1415ProMaxTwoModelObj:
          iphone1415ProMaxTwoModelObj ?? this.iphone1415ProMaxTwoModelObj,
    );
  }
}
