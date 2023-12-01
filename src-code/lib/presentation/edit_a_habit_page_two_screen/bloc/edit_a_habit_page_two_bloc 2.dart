import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/edit_a_habit_page_two_screen/models/edit_a_habit_page_two_model.dart';
part 'edit_a_habit_page_two_event.dart';
part 'edit_a_habit_page_two_state.dart';

/// A bloc that manages the state of a EditAHabitPageTwo according to the event that is dispatched to it.
class EditAHabitPageTwoBloc
    extends Bloc<EditAHabitPageTwoEvent, EditAHabitPageTwoState> {
  EditAHabitPageTwoBloc(EditAHabitPageTwoState initialState)
      : super(initialState) {
    on<EditAHabitPageTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EditAHabitPageTwoInitialEvent event,
    Emitter<EditAHabitPageTwoState> emit,
  ) async {
    emit(state.copyWith(timeController: TextEditingController()));
  }
}
