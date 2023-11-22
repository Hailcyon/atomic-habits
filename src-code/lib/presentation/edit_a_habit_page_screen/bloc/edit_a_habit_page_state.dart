// ignore_for_file: must_be_immutable

part of 'edit_a_habit_page_bloc.dart';

/// Represents the state of EditAHabitPage in the application.
class EditAHabitPageState extends Equatable {
  EditAHabitPageState({this.editAHabitPageModelObj});

  EditAHabitPageModel? editAHabitPageModelObj;

  @override
  List<Object?> get props => [
        editAHabitPageModelObj,
      ];
  EditAHabitPageState copyWith({EditAHabitPageModel? editAHabitPageModelObj}) {
    return EditAHabitPageState(
      editAHabitPageModelObj:
          editAHabitPageModelObj ?? this.editAHabitPageModelObj,
    );
  }
}
