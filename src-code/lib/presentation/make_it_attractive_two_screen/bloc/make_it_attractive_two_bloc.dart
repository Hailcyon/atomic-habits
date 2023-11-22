import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/make_it_attractive_two_screen/models/make_it_attractive_two_model.dart';
part 'make_it_attractive_two_event.dart';
part 'make_it_attractive_two_state.dart';

/// A bloc that manages the state of a MakeItAttractiveTwo according to the event that is dispatched to it.
class MakeItAttractiveTwoBloc
    extends Bloc<MakeItAttractiveTwoEvent, MakeItAttractiveTwoState> {
  MakeItAttractiveTwoBloc(MakeItAttractiveTwoState initialState)
      : super(initialState) {
    on<MakeItAttractiveTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MakeItAttractiveTwoInitialEvent event,
    Emitter<MakeItAttractiveTwoState> emit,
  ) async {}
}
