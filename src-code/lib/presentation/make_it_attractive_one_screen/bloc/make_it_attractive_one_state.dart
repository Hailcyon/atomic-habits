// ignore_for_file: must_be_immutable

part of 'make_it_attractive_one_bloc.dart';

/// Represents the state of MakeItAttractiveOne in the application.
class MakeItAttractiveOneState extends Equatable {
  MakeItAttractiveOneState({this.makeItAttractiveOneModelObj});

  MakeItAttractiveOneModel? makeItAttractiveOneModelObj;

  @override
  List<Object?> get props => [
        makeItAttractiveOneModelObj,
      ];
  MakeItAttractiveOneState copyWith(
      {MakeItAttractiveOneModel? makeItAttractiveOneModelObj}) {
    return MakeItAttractiveOneState(
      makeItAttractiveOneModelObj:
          makeItAttractiveOneModelObj ?? this.makeItAttractiveOneModelObj,
    );
  }
}
