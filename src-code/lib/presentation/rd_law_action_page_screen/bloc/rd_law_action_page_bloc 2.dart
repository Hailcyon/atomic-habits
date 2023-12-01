import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/rd_law_action_page_screen/models/rd_law_action_page_model.dart';
part 'rd_law_action_page_event.dart';
part 'rd_law_action_page_state.dart';

/// A bloc that manages the state of a RdLawActionPage according to the event that is dispatched to it.
class RdLawActionPageBloc
    extends Bloc<RdLawActionPageEvent, RdLawActionPageState> {
  RdLawActionPageBloc(RdLawActionPageState initialState) : super(initialState) {
    on<RdLawActionPageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RdLawActionPageInitialEvent event,
    Emitter<RdLawActionPageState> emit,
  ) async {}
}
