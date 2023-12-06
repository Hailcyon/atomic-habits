import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/make_it_easy_three_screen/models/make_it_easy_three_model.dart';
part 'make_it_easy_three_event.dart';
part 'make_it_easy_three_state.dart';

/// A bloc that manages the state of a MakeItEasyThree according to the event that is dispatched to it.
class MakeItEasyThreeBloc
    extends Bloc<MakeItEasyThreeEvent, MakeItEasyThreeState> {
  MakeItEasyThreeBloc(MakeItEasyThreeState initialState)
      : super(initialState) {
    on<MakeItEasyThreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MakeItEasyThreeInitialEvent event,
    Emitter<MakeItEasyThreeState> emit,
  ) async {
    emit(state.copyWith(
        runController: TextEditingController(),
        timeController: TextEditingController(),
        libertyparkController: TextEditingController()));
  }
}
