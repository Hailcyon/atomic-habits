// ignore_for_file: must_be_immutable

part of 'new_habit_search_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///NewHabitSearch widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NewHabitSearchEvent extends Equatable {}

/// Event that is dispatched when the NewHabitSearch widget is first created.
class NewHabitSearchInitialEvent extends NewHabitSearchEvent {
  @override
  List<Object?> get props => [];
}
