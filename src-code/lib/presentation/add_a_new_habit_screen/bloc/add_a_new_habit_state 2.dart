// ignore_for_file: must_be_immutable

part of 'add_a_new_habit_bloc.dart';

/// Represents the state of AddANewHabit in the application.
class AddANewHabitState extends Equatable {
  AddANewHabitState({this.addANewHabitModelObj});

  AddANewHabitModel? addANewHabitModelObj;

  @override
  List<Object?> get props => [
        addANewHabitModelObj,
      ];
  AddANewHabitState copyWith({AddANewHabitModel? addANewHabitModelObj}) {
    return AddANewHabitState(
      addANewHabitModelObj: addANewHabitModelObj ?? this.addANewHabitModelObj,
    );
  }
}
