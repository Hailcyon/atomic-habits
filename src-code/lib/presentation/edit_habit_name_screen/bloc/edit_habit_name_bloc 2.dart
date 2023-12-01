import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/edit_habit_name_screen/models/edit_habit_name_model.dart';
part 'edit_habit_name_event.dart';
part 'edit_habit_name_state.dart';

/// A bloc that manages the state of a EditHabitName according to the event that is dispatched to it.
class EditHabitNameBloc extends Bloc<EditHabitNameEvent, EditHabitNameState> {
  EditHabitNameBloc(EditHabitNameState initialState) : super(initialState) {
    on<EditHabitNameInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EditHabitNameInitialEvent event,
    Emitter<EditHabitNameState> emit,
  ) async {
    emit(state.copyWith(goforarunController: TextEditingController()));
  }
}
