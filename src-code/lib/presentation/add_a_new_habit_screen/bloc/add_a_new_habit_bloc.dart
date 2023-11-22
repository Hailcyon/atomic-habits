import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/add_a_new_habit_screen/models/add_a_new_habit_model.dart';
part 'add_a_new_habit_event.dart';
part 'add_a_new_habit_state.dart';

/// A bloc that manages the state of a AddANewHabit according to the event that is dispatched to it.
class AddANewHabitBloc extends Bloc<AddANewHabitEvent, AddANewHabitState> {
  AddANewHabitBloc(AddANewHabitState initialState) : super(initialState) {
    on<AddANewHabitInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AddANewHabitInitialEvent event,
    Emitter<AddANewHabitState> emit,
  ) async {}
}
