import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/home_page_skip_habit_screen/models/home_page_skip_habit_model.dart';
part 'home_page_skip_habit_event.dart';
part 'home_page_skip_habit_state.dart';

/// A bloc that manages the state of a HomePageSkipHabit according to the event that is dispatched to it.
class HomePageSkipHabitBloc
    extends Bloc<HomePageSkipHabitEvent, HomePageSkipHabitState> {
  HomePageSkipHabitBloc(HomePageSkipHabitState initialState)
      : super(initialState) {
    on<HomePageSkipHabitInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomePageSkipHabitInitialEvent event,
    Emitter<HomePageSkipHabitState> emit,
  ) async {}
}
