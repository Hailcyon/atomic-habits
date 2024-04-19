import 'package:ahapp3/presentation/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ahapp3/presentation/home_page_container_page/models/home_page_container_model.dart';
part 'home_page_container_event.dart';
part 'home_page_container_state.dart';

/// A bloc that manages the state of a HomePageContainer according to the event that is dispatched to it.
// class HomePageContainerBloc
//     extends Bloc<HomePageContainerEvent, HomePageContainerState> {
//   HomePageContainerBloc(HomePageContainerState initialState)
//       : super(initialState) {
//     on<HomePageContainerInitialEvent>(_onInitialize);
//   }

//   _onInitialize(
//     HomePageContainerInitialEvent event,
//     Emitter<HomePageContainerState> emit,
//   ) async {

//   }
// }

class HomePageContainerBloc
    extends Bloc<HomePageContainerEvent, HomePageContainerState> {
  HomePageContainerBloc()
      : super(HomePageContainerState(
          homePageContainerModelObj: HomePageContainerModel(),
        )) {
    on<HomePageContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomePageContainerInitialEvent event,
    Emitter<HomePageContainerState> emit,
  ) async {
    // Placeholder asynchronous initialization logic
    try {
      // Perform some asynchronous tasks, e.g., fetch data from a server
      final data = await Auth().currentUser;

      // Update the state with the fetched data
      emit(state.copyWith(data: data, isLoading: false, error: ''));
    } catch (e) {
      // Handle errors during initialization
      emit(state.copyWith(
          error: 'Failed to initialize: $e', isLoading: false, data: null));
    }
  }
}
