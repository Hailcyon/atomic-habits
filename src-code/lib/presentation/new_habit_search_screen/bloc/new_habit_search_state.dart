// ignore_for_file: must_be_immutable

part of 'new_habit_search_bloc.dart';

/// Represents the state of NewHabitSearch in the application.
class NewHabitSearchState extends Equatable {
  NewHabitSearchState({
    this.searchEditTextController,
    this.newHabitSearchModelObj,
  });

  TextEditingController? searchEditTextController;

  NewHabitSearchModel? newHabitSearchModelObj;

  @override
  List<Object?> get props => [
        searchEditTextController,
        newHabitSearchModelObj,
      ];
  NewHabitSearchState copyWith({
    TextEditingController? searchEditTextController,
    NewHabitSearchModel? newHabitSearchModelObj,
  }) {
    return NewHabitSearchState(
      searchEditTextController:
          searchEditTextController ?? this.searchEditTextController,
      newHabitSearchModelObj:
          newHabitSearchModelObj ?? this.newHabitSearchModelObj,
    );
  }
}
