import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/new_habit_search_screen/models/new_habit_search_model.dart';
part 'new_habit_search_event.dart';
part 'new_habit_search_state.dart';

/// A bloc that manages the state of a NewHabitSearch according to the event that is dispatched to it.
class NewHabitSearchBloc
    extends Bloc<NewHabitSearchEvent, NewHabitSearchState> {
  NewHabitSearchBloc(NewHabitSearchState initialState) : super(initialState) {
    on<NewHabitSearchInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NewHabitSearchInitialEvent event,
    Emitter<NewHabitSearchState> emit,
  ) async {
    emit(state.copyWith(searchEditTextController: TextEditingController()));
  }
}
