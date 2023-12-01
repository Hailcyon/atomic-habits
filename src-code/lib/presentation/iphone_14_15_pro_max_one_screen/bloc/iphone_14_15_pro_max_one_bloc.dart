import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/reducefriction_item_model.dart';
import 'package:ahapp3/presentation/iphone_14_15_pro_max_one_screen/models/iphone_14_15_pro_max_one_model.dart';
part 'iphone_14_15_pro_max_one_event.dart';
part 'iphone_14_15_pro_max_one_state.dart';

/// A bloc that manages the state of a Iphone1415ProMaxOne according to the event that is dispatched to it.
class Iphone1415ProMaxOneBloc
    extends Bloc<Iphone1415ProMaxOneEvent, Iphone1415ProMaxOneState> {
  Iphone1415ProMaxOneBloc(Iphone1415ProMaxOneState initialState)
      : super(initialState) {
    on<Iphone1415ProMaxOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    Iphone1415ProMaxOneInitialEvent event,
    Emitter<Iphone1415ProMaxOneState> emit,
  ) async {
    emit(state.copyWith(
        iphone1415ProMaxOneModelObj: state.iphone1415ProMaxOneModelObj
            ?.copyWith(reducefrictionItemList: fillReducefrictionItemList())));
  }

  List<ReducefrictionItemModel> fillReducefrictionItemList() {
    return [
      ReducefrictionItemModel(
          reduceFriction: "Reduce Friction",
          reduceFriction1: "Reduce Friction",
          reduceFriction2: "Reduce Friction"),
      ReducefrictionItemModel(
          reduceFriction: "Two Minute Rule",
          reduceFriction1: "Two Minute Rule",
          reduceFriction2: "Two Minute Rule"),
      ReducefrictionItemModel(
          reduceFriction: "Habit Automation",
          reduceFriction1: "Habit Automation",
          reduceFriction2: "Habit Automation")
    ];
  }
}
