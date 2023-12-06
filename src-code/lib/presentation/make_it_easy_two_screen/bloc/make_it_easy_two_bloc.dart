import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/make_it_easy_two_screen/models/make_it_easy_two_model.dart';
part 'make_it_easy_two_event.dart';
part 'make_it_easy_two_state.dart';

/// A bloc that manages the state of a MakeItAttractiveTwo according to the event that is dispatched to it.
class MakeItEasyTwoBloc
    extends Bloc<MakeItEasyTwoEvent, MakeItEasyTwoState> {
  MakeItEasyTwoBloc(MakeItEasyTwoState initialState)
      : super(initialState) {
    on<MakeItEasyTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MakeItEasyTwoInitialEvent event,
    Emitter<MakeItEasyTwoState> emit,
  ) async {}
}


