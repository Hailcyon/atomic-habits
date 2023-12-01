// ignore_for_file: must_be_immutable

part of 'iphone_14_15_pro_max_one_bloc.dart';

/// Represents the state of Iphone1415ProMaxOne in the application.
class Iphone1415ProMaxOneState extends Equatable {
  Iphone1415ProMaxOneState({this.iphone1415ProMaxOneModelObj});

  Iphone1415ProMaxOneModel? iphone1415ProMaxOneModelObj;

  @override
  List<Object?> get props => [
        iphone1415ProMaxOneModelObj,
      ];
  Iphone1415ProMaxOneState copyWith(
      {Iphone1415ProMaxOneModel? iphone1415ProMaxOneModelObj}) {
    return Iphone1415ProMaxOneState(
      iphone1415ProMaxOneModelObj:
          iphone1415ProMaxOneModelObj ?? this.iphone1415ProMaxOneModelObj,
    );
  }
}
