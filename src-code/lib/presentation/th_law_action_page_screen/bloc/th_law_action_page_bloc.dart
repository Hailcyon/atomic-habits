import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/th_law_action_page_screen/models/th_law_action_page_model.dart';
part 'th_law_action_page_event.dart';
part 'th_law_action_page_state.dart';

/// A bloc that manages the state of a ThLawActionPage according to the event that is dispatched to it.
class ThLawActionPageBloc
    extends Bloc<ThLawActionPageEvent, ThLawActionPageState> {
  ThLawActionPageBloc(ThLawActionPageState initialState) : super(initialState) {
    on<ThLawActionPageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ThLawActionPageInitialEvent event,
    Emitter<ThLawActionPageState> emit,
  ) async {}
}
