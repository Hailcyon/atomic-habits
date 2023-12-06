import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/make_it_easy_one_model.dart';
import '/core/app_export.dart';
// import 'package:ahapp3/presentation/make_it_attractive_one_screen/models/make_it_attractive_one_model.dart';
part 'make_it_easy_one_event.dart';
part 'make_it_easy_one_state.dart';

/// A bloc that manages the state of a MakeItAttractiveOne according to the event that is dispatched to it.
class MakeItEasyOneBloc
    extends Bloc<MakeItEasyOneEvent, MakeItEasyOneState> {
  MakeItEasyOneBloc(MakeItEasyOneState initialState)
      : super(initialState) {
    on<MakeItEasyOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MakeItEasyOneInitialEvent event,
    Emitter<MakeItEasyOneState> emit,
  ) async {}
}
