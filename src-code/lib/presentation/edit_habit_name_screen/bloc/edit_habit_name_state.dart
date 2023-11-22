// ignore_for_file: must_be_immutable

part of 'edit_habit_name_bloc.dart';

/// Represents the state of EditHabitName in the application.
class EditHabitNameState extends Equatable {
  EditHabitNameState({
    this.habitNameController,
    this.editHabitNameModelObj,
  });

  TextEditingController? habitNameController;

  EditHabitNameModel? editHabitNameModelObj;

  @override
  List<Object?> get props => [
        habitNameController,
        editHabitNameModelObj,
      ];
  EditHabitNameState copyWith({
    TextEditingController? habitNameController,
    EditHabitNameModel? editHabitNameModelObj,
  }) {
    return EditHabitNameState(
      habitNameController: habitNameController ?? this.habitNameController,
      editHabitNameModelObj:
          editHabitNameModelObj ?? this.editHabitNameModelObj,
    );
  }
}
