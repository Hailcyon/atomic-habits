// ignore_for_file: must_be_immutable

part of 'home_page_check_habit_bloc.dart';

/// Represents the state of HomePageCheckHabit in the application.
class HomePageCheckHabitState extends Equatable {
  HomePageCheckHabitState({this.homePageCheckHabitModelObj});

  HomePageCheckHabitModel? homePageCheckHabitModelObj;

  @override
  List<Object?> get props => [
        homePageCheckHabitModelObj,
      ];
  HomePageCheckHabitState copyWith(
      {HomePageCheckHabitModel? homePageCheckHabitModelObj}) {
    return HomePageCheckHabitState(
      homePageCheckHabitModelObj:
          homePageCheckHabitModelObj ?? this.homePageCheckHabitModelObj,
    );
  }
}
