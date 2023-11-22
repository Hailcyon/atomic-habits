// ignore_for_file: must_be_immutable

part of 'rd_law_action_page_bloc.dart';

/// Represents the state of RdLawActionPage in the application.
class RdLawActionPageState extends Equatable {
  RdLawActionPageState({this.rdLawActionPageModelObj});

  RdLawActionPageModel? rdLawActionPageModelObj;

  @override
  List<Object?> get props => [
        rdLawActionPageModelObj,
      ];
  RdLawActionPageState copyWith(
      {RdLawActionPageModel? rdLawActionPageModelObj}) {
    return RdLawActionPageState(
      rdLawActionPageModelObj:
          rdLawActionPageModelObj ?? this.rdLawActionPageModelObj,
    );
  }
}
