import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/edit_a_habit_page_screen/models/edit_a_habit_page_model.dart';
part 'edit_a_habit_page_event.dart';
part 'edit_a_habit_page_state.dart';

/// A bloc that manages the state of a EditAHabitPage according to the event that is dispatched to it.
class EditAHabitPageBloc
    extends Bloc<EditAHabitPageEvent, EditAHabitPageState> {
  EditAHabitPageBloc(EditAHabitPageState initialState) : super(initialState) {
    on<EditAHabitPageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EditAHabitPageInitialEvent event,
    Emitter<EditAHabitPageState> emit,
  ) async {}
}
