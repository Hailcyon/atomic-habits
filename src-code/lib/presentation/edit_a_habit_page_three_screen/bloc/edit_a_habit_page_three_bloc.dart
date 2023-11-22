import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/edit_a_habit_page_three_screen/models/edit_a_habit_page_three_model.dart';
part 'edit_a_habit_page_three_event.dart';
part 'edit_a_habit_page_three_state.dart';

/// A bloc that manages the state of a EditAHabitPageThree according to the event that is dispatched to it.
class EditAHabitPageThreeBloc
    extends Bloc<EditAHabitPageThreeEvent, EditAHabitPageThreeState> {
  EditAHabitPageThreeBloc(EditAHabitPageThreeState initialState)
      : super(initialState) {
    on<EditAHabitPageThreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EditAHabitPageThreeInitialEvent event,
    Emitter<EditAHabitPageThreeState> emit,
  ) async {}
}
