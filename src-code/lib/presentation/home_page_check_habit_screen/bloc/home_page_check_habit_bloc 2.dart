import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/home_page_check_habit_screen/models/home_page_check_habit_model.dart';
part 'home_page_check_habit_event.dart';
part 'home_page_check_habit_state.dart';

/// A bloc that manages the state of a HomePageCheckHabit according to the event that is dispatched to it.
class HomePageCheckHabitBloc
    extends Bloc<HomePageCheckHabitEvent, HomePageCheckHabitState> {
  HomePageCheckHabitBloc(HomePageCheckHabitState initialState)
      : super(initialState) {
    on<HomePageCheckHabitInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomePageCheckHabitInitialEvent event,
    Emitter<HomePageCheckHabitState> emit,
  ) async {}
}
