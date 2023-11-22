import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/make_it_attractive_one_screen/models/make_it_attractive_one_model.dart';
part 'make_it_attractive_one_event.dart';
part 'make_it_attractive_one_state.dart';

/// A bloc that manages the state of a MakeItAttractiveOne according to the event that is dispatched to it.
class MakeItAttractiveOneBloc
    extends Bloc<MakeItAttractiveOneEvent, MakeItAttractiveOneState> {
  MakeItAttractiveOneBloc(MakeItAttractiveOneState initialState)
      : super(initialState) {
    on<MakeItAttractiveOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MakeItAttractiveOneInitialEvent event,
    Emitter<MakeItAttractiveOneState> emit,
  ) async {}
}
