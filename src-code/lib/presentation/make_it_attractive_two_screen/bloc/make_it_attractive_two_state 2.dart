// ignore_for_file: must_be_immutable

part of 'make_it_attractive_two_bloc.dart';

/// Represents the state of MakeItAttractiveTwo in the application.
class MakeItAttractiveTwoState extends Equatable {
  MakeItAttractiveTwoState({this.makeItAttractiveTwoModelObj});

  MakeItAttractiveTwoModel? makeItAttractiveTwoModelObj;

  @override
  List<Object?> get props => [
        makeItAttractiveTwoModelObj,
      ];
  MakeItAttractiveTwoState copyWith(
      {MakeItAttractiveTwoModel? makeItAttractiveTwoModelObj}) {
    return MakeItAttractiveTwoState(
      makeItAttractiveTwoModelObj:
          makeItAttractiveTwoModelObj ?? this.makeItAttractiveTwoModelObj,
    );
  }
}
