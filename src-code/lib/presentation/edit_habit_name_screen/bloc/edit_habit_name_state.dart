// ignore_for_file: must_be_immutable

part of 'edit_habit_name_bloc.dart';

/// Represents the state of EditHabitName in the application.
class EditHabitNameState extends Equatable {
  EditHabitNameState({
    this.goforarunController,
    this.editHabitNameModelObj,
  });

  TextEditingController? goforarunController;

  EditHabitNameModel? editHabitNameModelObj;

  @override
  List<Object?> get props => [
        goforarunController,
        editHabitNameModelObj,
      ];
  EditHabitNameState copyWith({
    TextEditingController? goforarunController,
    EditHabitNameModel? editHabitNameModelObj,
  }) {
    return EditHabitNameState(
      goforarunController: goforarunController ?? this.goforarunController,
      editHabitNameModelObj:
          editHabitNameModelObj ?? this.editHabitNameModelObj,
    );
  }
}
