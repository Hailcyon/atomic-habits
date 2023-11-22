import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/reinforcement_screen/models/reinforcement_model.dart';
part 'reinforcement_event.dart';
part 'reinforcement_state.dart';

/// A bloc that manages the state of a Reinforcement according to the event that is dispatched to it.
class ReinforcementBloc extends Bloc<ReinforcementEvent, ReinforcementState> {
  ReinforcementBloc(ReinforcementState initialState) : super(initialState) {
    on<ReinforcementInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ReinforcementInitialEvent event,
    Emitter<ReinforcementState> emit,
  ) async {
    emit(state.copyWith(editTextController: TextEditingController()));
  }
}
