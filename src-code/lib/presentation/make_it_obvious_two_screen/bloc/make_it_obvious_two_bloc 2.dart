import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/make_it_obvious_two_screen/models/make_it_obvious_two_model.dart';
part 'make_it_obvious_two_event.dart';
part 'make_it_obvious_two_state.dart';

/// A bloc that manages the state of a MakeItObviousTwo according to the event that is dispatched to it.
class MakeItObviousTwoBloc
    extends Bloc<MakeItObviousTwoEvent, MakeItObviousTwoState> {
  MakeItObviousTwoBloc(MakeItObviousTwoState initialState)
      : super(initialState) {
    on<MakeItObviousTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MakeItObviousTwoInitialEvent event,
    Emitter<MakeItObviousTwoState> emit,
  ) async {}
}
