// ignore_for_file: must_be_immutable

part of 'make_it_obvious_two_bloc.dart';

/// Represents the state of MakeItObviousTwo in the application.
class MakeItObviousTwoState extends Equatable {
  MakeItObviousTwoState({this.makeItObviousTwoModelObj});

  MakeItObviousTwoModel? makeItObviousTwoModelObj;

  @override
  List<Object?> get props => [
        makeItObviousTwoModelObj,
      ];
  MakeItObviousTwoState copyWith(
      {MakeItObviousTwoModel? makeItObviousTwoModelObj}) {
    return MakeItObviousTwoState(
      makeItObviousTwoModelObj:
          makeItObviousTwoModelObj ?? this.makeItObviousTwoModelObj,
    );
  }
}
