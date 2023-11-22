// ignore_for_file: must_be_immutable

part of 'customize_save_habit_bloc.dart';

/// Represents the state of CustomizeSaveHabit in the application.
class CustomizeSaveHabitState extends Equatable {
  CustomizeSaveHabitState({
    this.fortyEightIconController,
    this.fortyEightGoForARunController,
    this.customizeSaveHabitModelObj,
  });

  TextEditingController? fortyEightIconController;

  TextEditingController? fortyEightGoForARunController;

  CustomizeSaveHabitModel? customizeSaveHabitModelObj;

  @override
  List<Object?> get props => [
        fortyEightIconController,
        fortyEightGoForARunController,
        customizeSaveHabitModelObj,
      ];
  CustomizeSaveHabitState copyWith({
    TextEditingController? fortyEightIconController,
    TextEditingController? fortyEightGoForARunController,
    CustomizeSaveHabitModel? customizeSaveHabitModelObj,
  }) {
    return CustomizeSaveHabitState(
      fortyEightIconController:
          fortyEightIconController ?? this.fortyEightIconController,
      fortyEightGoForARunController:
          fortyEightGoForARunController ?? this.fortyEightGoForARunController,
      customizeSaveHabitModelObj:
          customizeSaveHabitModelObj ?? this.customizeSaveHabitModelObj,
    );
  }
}
