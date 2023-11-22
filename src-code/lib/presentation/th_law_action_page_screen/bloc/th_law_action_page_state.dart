// ignore_for_file: must_be_immutable

part of 'th_law_action_page_bloc.dart';

/// Represents the state of ThLawActionPage in the application.
class ThLawActionPageState extends Equatable {
  ThLawActionPageState({this.thLawActionPageModelObj});

  ThLawActionPageModel? thLawActionPageModelObj;

  @override
  List<Object?> get props => [
        thLawActionPageModelObj,
      ];
  ThLawActionPageState copyWith(
      {ThLawActionPageModel? thLawActionPageModelObj}) {
    return ThLawActionPageState(
      thLawActionPageModelObj:
          thLawActionPageModelObj ?? this.thLawActionPageModelObj,
    );
  }
}
