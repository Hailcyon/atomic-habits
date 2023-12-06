// ignore_for_file: must_be_immutable

part of 'make_it_easy_one_bloc.dart';

/// Represents the state of MakeItEasyiveOne in the application.
class MakeItEasyOneState extends Equatable {
  MakeItEasyOneState({this.makeItEasyOneModelObj});

  MakeItEasyOneModel? makeItEasyOneModelObj;

  @override
  List<Object?> get props => [
        makeItEasyOneModelObj,
      ];
  MakeItEasyOneState copyWith(
      {MakeItEasyOneModel? makeItEasyOneModelObj}) {
    return MakeItEasyOneState(
      makeItEasyOneModelObj:
          makeItEasyOneModelObj ?? this.makeItEasyOneModelObj,
    );
  }
}
