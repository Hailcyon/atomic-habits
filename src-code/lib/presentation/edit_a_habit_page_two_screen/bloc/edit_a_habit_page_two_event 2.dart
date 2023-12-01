// ignore_for_file: must_be_immutable

part of 'edit_a_habit_page_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EditAHabitPageTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EditAHabitPageTwoEvent extends Equatable {}

/// Event that is dispatched when the EditAHabitPageTwo widget is first created.
class EditAHabitPageTwoInitialEvent extends EditAHabitPageTwoEvent {
  @override
  List<Object?> get props => [];
}
