// ignore_for_file: must_be_immutable

part of 'edit_a_habit_page_two_bloc.dart';

/// Represents the state of EditAHabitPageTwo in the application.
class EditAHabitPageTwoState extends Equatable {
  EditAHabitPageTwoState({
    this.timeController,
    this.editAHabitPageTwoModelObj,
  });

  TextEditingController? timeController;

  EditAHabitPageTwoModel? editAHabitPageTwoModelObj;

  @override
  List<Object?> get props => [
        timeController,
        editAHabitPageTwoModelObj,
      ];
  EditAHabitPageTwoState copyWith({
    TextEditingController? timeController,
    EditAHabitPageTwoModel? editAHabitPageTwoModelObj,
  }) {
    return EditAHabitPageTwoState(
      timeController: timeController ?? this.timeController,
      editAHabitPageTwoModelObj:
          editAHabitPageTwoModelObj ?? this.editAHabitPageTwoModelObj,
    );
  }
}
