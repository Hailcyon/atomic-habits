// ignore_for_file: must_be_immutable

part of 'th_law_page_bloc.dart';

/// Represents the state of ThLawPage in the application.
class ThLawPageState extends Equatable {
  ThLawPageState({this.thLawPageModelObj});

  ThLawPageModel? thLawPageModelObj;

  @override
  List<Object?> get props => [
        thLawPageModelObj,
      ];
  ThLawPageState copyWith({ThLawPageModel? thLawPageModelObj}) {
    return ThLawPageState(
      thLawPageModelObj: thLawPageModelObj ?? this.thLawPageModelObj,
    );
  }
}
