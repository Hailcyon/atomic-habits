import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/th_law_page_screen/models/th_law_page_model.dart';
part 'th_law_page_event.dart';
part 'th_law_page_state.dart';

/// A bloc that manages the state of a ThLawPage according to the event that is dispatched to it.
class ThLawPageBloc extends Bloc<ThLawPageEvent, ThLawPageState> {
  ThLawPageBloc(ThLawPageState initialState) : super(initialState) {
    on<ThLawPageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ThLawPageInitialEvent event,
    Emitter<ThLawPageState> emit,
  ) async {}
}
