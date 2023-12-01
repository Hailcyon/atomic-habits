// ignore_for_file: must_be_immutable

part of 'new_habit_search_bloc.dart';

/// Represents the state of NewHabitSearch in the application.
class NewHabitSearchState extends Equatable {
  NewHabitSearchState({
    this.searchController,
    this.newHabitSearchModelObj,
  });

  TextEditingController? searchController;

  NewHabitSearchModel? newHabitSearchModelObj;

  @override
  List<Object?> get props => [
        searchController,
        newHabitSearchModelObj,
      ];
  NewHabitSearchState copyWith({
    TextEditingController? searchController,
    NewHabitSearchModel? newHabitSearchModelObj,
  }) {
    return NewHabitSearchState(
      searchController: searchController ?? this.searchController,
      newHabitSearchModelObj:
          newHabitSearchModelObj ?? this.newHabitSearchModelObj,
    );
  }
}
