import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/implementation_int_screen/models/implementation_int_model.dart';
part 'implementation_int_event.dart';
part 'implementation_int_state.dart';

/// A bloc that manages the state of a ImplementationInt according to the event that is dispatched to it.
class ImplementationIntBloc
    extends Bloc<ImplementationIntEvent, ImplementationIntState> {
  ImplementationIntBloc(ImplementationIntState initialState)
      : super(initialState) {
    on<ImplementationIntInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ImplementationIntInitialEvent event,
    Emitter<ImplementationIntState> emit,
  ) async {
    emit(state.copyWith(
        habitTextController: TextEditingController(),
        habitTimeTextController: TextEditingController(),
        habitLocationTextController: TextEditingController()));
  }
}
