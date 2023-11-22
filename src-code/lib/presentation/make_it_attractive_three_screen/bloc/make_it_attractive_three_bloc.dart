import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/make_it_attractive_three_screen/models/make_it_attractive_three_model.dart';
part 'make_it_attractive_three_event.dart';
part 'make_it_attractive_three_state.dart';

/// A bloc that manages the state of a MakeItAttractiveThree according to the event that is dispatched to it.
class MakeItAttractiveThreeBloc
    extends Bloc<MakeItAttractiveThreeEvent, MakeItAttractiveThreeState> {
  MakeItAttractiveThreeBloc(MakeItAttractiveThreeState initialState)
      : super(initialState) {
    on<MakeItAttractiveThreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MakeItAttractiveThreeInitialEvent event,
    Emitter<MakeItAttractiveThreeState> emit,
  ) async {}
}
