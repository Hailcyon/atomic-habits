// ignore_for_file: must_be_immutable

part of 'home_page_skip_habit_bloc.dart';

/// Represents the state of HomePageSkipHabit in the application.
class HomePageSkipHabitState extends Equatable {
  HomePageSkipHabitState({this.homePageSkipHabitModelObj});

  HomePageSkipHabitModel? homePageSkipHabitModelObj;

  @override
  List<Object?> get props => [
        homePageSkipHabitModelObj,
      ];
  HomePageSkipHabitState copyWith(
      {HomePageSkipHabitModel? homePageSkipHabitModelObj}) {
    return HomePageSkipHabitState(
      homePageSkipHabitModelObj:
          homePageSkipHabitModelObj ?? this.homePageSkipHabitModelObj,
    );
  }
}
