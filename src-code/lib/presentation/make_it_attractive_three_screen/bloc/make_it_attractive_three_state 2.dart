// ignore_for_file: must_be_immutable

part of 'make_it_attractive_three_bloc.dart';

/// Represents the state of MakeItAttractiveThree in the application.
class MakeItAttractiveThreeState extends Equatable {
  MakeItAttractiveThreeState({this.makeItAttractiveThreeModelObj});

  MakeItAttractiveThreeModel? makeItAttractiveThreeModelObj;

  @override
  List<Object?> get props => [
        makeItAttractiveThreeModelObj,
      ];
  MakeItAttractiveThreeState copyWith(
      {MakeItAttractiveThreeModel? makeItAttractiveThreeModelObj}) {
    return MakeItAttractiveThreeState(
      makeItAttractiveThreeModelObj:
          makeItAttractiveThreeModelObj ?? this.makeItAttractiveThreeModelObj,
    );
  }
}
