// ignore_for_file: must_be_immutable

part of 'home_page_check_habit_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomePageCheckHabit widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomePageCheckHabitEvent extends Equatable {}

/// Event that is dispatched when the HomePageCheckHabit widget is first created.
class HomePageCheckHabitInitialEvent extends HomePageCheckHabitEvent {
  @override
  List<Object?> get props => [];
}
