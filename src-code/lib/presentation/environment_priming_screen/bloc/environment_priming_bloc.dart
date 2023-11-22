import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/environment_priming_screen/models/environment_priming_model.dart';
part 'environment_priming_event.dart';
part 'environment_priming_state.dart';

/// A bloc that manages the state of a EnvironmentPriming according to the event that is dispatched to it.
class EnvironmentPrimingBloc
    extends Bloc<EnvironmentPrimingEvent, EnvironmentPrimingState> {
  EnvironmentPrimingBloc(EnvironmentPrimingState initialState)
      : super(initialState) {
    on<EnvironmentPrimingInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EnvironmentPrimingInitialEvent event,
    Emitter<EnvironmentPrimingState> emit,
  ) async {
    emit(state.copyWith(editTextController: TextEditingController()));
  }
}
