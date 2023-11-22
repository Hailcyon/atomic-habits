// ignore_for_file: must_be_immutable

part of 'edit_a_habit_page_three_bloc.dart';

/// Represents the state of EditAHabitPageThree in the application.
class EditAHabitPageThreeState extends Equatable {
  EditAHabitPageThreeState({this.editAHabitPageThreeModelObj});

  EditAHabitPageThreeModel? editAHabitPageThreeModelObj;

  @override
  List<Object?> get props => [
        editAHabitPageThreeModelObj,
      ];
  EditAHabitPageThreeState copyWith(
      {EditAHabitPageThreeModel? editAHabitPageThreeModelObj}) {
    return EditAHabitPageThreeState(
      editAHabitPageThreeModelObj:
          editAHabitPageThreeModelObj ?? this.editAHabitPageThreeModelObj,
    );
  }
}
