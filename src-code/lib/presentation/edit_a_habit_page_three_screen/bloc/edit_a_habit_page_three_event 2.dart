// ignore_for_file: must_be_immutable

part of 'edit_a_habit_page_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EditAHabitPageThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EditAHabitPageThreeEvent extends Equatable {}

/// Event that is dispatched when the EditAHabitPageThree widget is first created.
class EditAHabitPageThreeInitialEvent extends EditAHabitPageThreeEvent {
  @override
  List<Object?> get props => [];
}
