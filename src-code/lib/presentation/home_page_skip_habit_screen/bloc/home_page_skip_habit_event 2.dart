// ignore_for_file: must_be_immutable

part of 'home_page_skip_habit_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomePageSkipHabit widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomePageSkipHabitEvent extends Equatable {}

/// Event that is dispatched when the HomePageSkipHabit widget is first created.
class HomePageSkipHabitInitialEvent extends HomePageSkipHabitEvent {
  @override
  List<Object?> get props => [];
}
