import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/make_it_obvious_one_screen/models/make_it_obvious_one_model.dart';
part 'make_it_obvious_one_event.dart';
part 'make_it_obvious_one_state.dart';

/// A bloc that manages the state of a MakeItObviousOne according to the event that is dispatched to it.
class MakeItObviousOneBloc
    extends Bloc<MakeItObviousOneEvent, MakeItObviousOneState> {
  MakeItObviousOneBloc(MakeItObviousOneState initialState)
      : super(initialState) {
    on<MakeItObviousOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MakeItObviousOneInitialEvent event,
    Emitter<MakeItObviousOneState> emit,
  ) async {}
}
