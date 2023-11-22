// ignore_for_file: must_be_immutable

part of 'edit_habit_name_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EditHabitName widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EditHabitNameEvent extends Equatable {}

/// Event that is dispatched when the EditHabitName widget is first created.
class EditHabitNameInitialEvent extends EditHabitNameEvent {
  @override
  List<Object?> get props => [];
}
