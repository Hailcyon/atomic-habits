import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/iphone_14_15_pro_max_two_screen/models/iphone_14_15_pro_max_two_model.dart';
part 'iphone_14_15_pro_max_two_event.dart';
part 'iphone_14_15_pro_max_two_state.dart';

/// A bloc that manages the state of a Iphone1415ProMaxTwo according to the event that is dispatched to it.
class Iphone1415ProMaxTwoBloc
    extends Bloc<Iphone1415ProMaxTwoEvent, Iphone1415ProMaxTwoState> {
  Iphone1415ProMaxTwoBloc(Iphone1415ProMaxTwoState initialState)
      : super(initialState) {
    on<Iphone1415ProMaxTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    Iphone1415ProMaxTwoInitialEvent event,
    Emitter<Iphone1415ProMaxTwoState> emit,
  ) async {}
}
