// ignore_for_file: must_be_immutable

part of 'add_a_new_habit_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddANewHabit widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddANewHabitEvent extends Equatable {}

/// Event that is dispatched when the AddANewHabit widget is first created.
class AddANewHabitInitialEvent extends AddANewHabitEvent {
  @override
  List<Object?> get props => [];
}
