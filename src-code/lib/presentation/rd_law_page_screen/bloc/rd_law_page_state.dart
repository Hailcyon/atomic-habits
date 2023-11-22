// ignore_for_file: must_be_immutable

part of 'rd_law_page_bloc.dart';

/// Represents the state of RdLawPage in the application.
class RdLawPageState extends Equatable {
  RdLawPageState({this.rdLawPageModelObj});

  RdLawPageModel? rdLawPageModelObj;

  @override
  List<Object?> get props => [
        rdLawPageModelObj,
      ];
  RdLawPageState copyWith({RdLawPageModel? rdLawPageModelObj}) {
    return RdLawPageState(
      rdLawPageModelObj: rdLawPageModelObj ?? this.rdLawPageModelObj,
    );
  }
}
