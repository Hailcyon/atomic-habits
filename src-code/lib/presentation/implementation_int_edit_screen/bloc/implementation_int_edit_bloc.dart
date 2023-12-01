import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/implementation_int_edit_screen/models/implementation_int_edit_model.dart';
part 'implementation_int_edit_event.dart';
part 'implementation_int_edit_state.dart';

/// A bloc that manages the state of a ImplementationIntEdit according to the event that is dispatched to it.
class ImplementationIntEditBloc
    extends Bloc<ImplementationIntEditEvent, ImplementationIntEditState> {
  ImplementationIntEditBloc(ImplementationIntEditState initialState)
      : super(initialState) {
    on<ImplementationIntEditInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ImplementationIntEditInitialEvent event,
    Emitter<ImplementationIntEditState> emit,
  ) async {
    emit(state.copyWith(
        runController: TextEditingController(),
        timeController: TextEditingController(),
        libertyparkController: TextEditingController()));
  }
}
