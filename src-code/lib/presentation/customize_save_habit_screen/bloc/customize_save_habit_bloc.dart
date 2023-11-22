import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/customize_save_habit_screen/models/customize_save_habit_model.dart';
part 'customize_save_habit_event.dart';
part 'customize_save_habit_state.dart';

/// A bloc that manages the state of a CustomizeSaveHabit according to the event that is dispatched to it.
class CustomizeSaveHabitBloc
    extends Bloc<CustomizeSaveHabitEvent, CustomizeSaveHabitState> {
  CustomizeSaveHabitBloc(CustomizeSaveHabitState initialState)
      : super(initialState) {
    on<CustomizeSaveHabitInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CustomizeSaveHabitInitialEvent event,
    Emitter<CustomizeSaveHabitState> emit,
  ) async {
    emit(state.copyWith(
        fortyEightIconController: TextEditingController(),
        fortyEightGoForARunController: TextEditingController()));
  }
}
