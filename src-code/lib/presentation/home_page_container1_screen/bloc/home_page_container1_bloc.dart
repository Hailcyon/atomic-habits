import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/home_page_container1_screen/models/home_page_container1_model.dart';
part 'home_page_container1_event.dart';
part 'home_page_container1_state.dart';

/// A bloc that manages the state of a HomePageContainer1 according to the event that is dispatched to it.
class HomePageContainer1Bloc
    extends Bloc<HomePageContainer1Event, HomePageContainer1State> {
  HomePageContainer1Bloc(HomePageContainer1State initialState)
      : super(initialState) {
    on<HomePageContainer1InitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomePageContainer1InitialEvent event,
    Emitter<HomePageContainer1State> emit,
  ) async {}
}
