// ignore_for_file: must_be_immutable

part of 'customize_save_habit_bloc.dart';

/// Represents the state of CustomizeSaveHabit in the application.
class CustomizeSaveHabitState extends Equatable {
  CustomizeSaveHabitState({
    this.icondirectionsrunController,
    this.goforarunController,
    this.customizeSaveHabitModelObj,
  });

  TextEditingController? icondirectionsrunController;

  TextEditingController? goforarunController;

  CustomizeSaveHabitModel? customizeSaveHabitModelObj;

  @override
  List<Object?> get props => [
        icondirectionsrunController,
        goforarunController,
        customizeSaveHabitModelObj,
      ];
  CustomizeSaveHabitState copyWith({
    TextEditingController? icondirectionsrunController,
    TextEditingController? goforarunController,
    CustomizeSaveHabitModel? customizeSaveHabitModelObj,
  }) {
    return CustomizeSaveHabitState(
      icondirectionsrunController:
          icondirectionsrunController ?? this.icondirectionsrunController,
      goforarunController: goforarunController ?? this.goforarunController,
      customizeSaveHabitModelObj:
          customizeSaveHabitModelObj ?? this.customizeSaveHabitModelObj,
    );
  }
}
