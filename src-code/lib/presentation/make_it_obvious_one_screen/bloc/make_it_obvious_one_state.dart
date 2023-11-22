// ignore_for_file: must_be_immutable

part of 'make_it_obvious_one_bloc.dart';

/// Represents the state of MakeItObviousOne in the application.
class MakeItObviousOneState extends Equatable {
  MakeItObviousOneState({this.makeItObviousOneModelObj});

  MakeItObviousOneModel? makeItObviousOneModelObj;

  @override
  List<Object?> get props => [
        makeItObviousOneModelObj,
      ];
  MakeItObviousOneState copyWith(
      {MakeItObviousOneModel? makeItObviousOneModelObj}) {
    return MakeItObviousOneState(
      makeItObviousOneModelObj:
          makeItObviousOneModelObj ?? this.makeItObviousOneModelObj,
    );
  }
}
