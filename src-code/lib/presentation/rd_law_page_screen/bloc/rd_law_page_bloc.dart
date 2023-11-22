import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/sixtyone_item_model.dart';
import 'package:ahapp3/presentation/rd_law_page_screen/models/rd_law_page_model.dart';
part 'rd_law_page_event.dart';
part 'rd_law_page_state.dart';

/// A bloc that manages the state of a RdLawPage according to the event that is dispatched to it.
class RdLawPageBloc extends Bloc<RdLawPageEvent, RdLawPageState> {
  RdLawPageBloc(RdLawPageState initialState) : super(initialState) {
    on<RdLawPageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RdLawPageInitialEvent event,
    Emitter<RdLawPageState> emit,
  ) async {
    emit(state.copyWith(
        rdLawPageModelObj: state.rdLawPageModelObj
            ?.copyWith(sixtyoneItemList: fillSixtyoneItemList())));
  }

  List<SixtyoneItemModel> fillSixtyoneItemList() {
    return [
      SixtyoneItemModel(
          reduceFriction: "Reduce Friction",
          reduceFriction1: "Reduce Friction",
          reduceFriction2: "Reduce Friction"),
      SixtyoneItemModel(
          reduceFriction: "Two Minute Rule",
          reduceFriction1: "Two Minute Rule",
          reduceFriction2: "Two Minute Rule"),
      SixtyoneItemModel(
          reduceFriction: "Habit Automation",
          reduceFriction1: "Habit Automation",
          reduceFriction2: "Habit Automation"),
      SixtyoneItemModel(
          reduceFriction: "Environment Priming",
          reduceFriction1: "Environment Priming",
          reduceFriction2: "Environment Priming")
    ];
  }
}
