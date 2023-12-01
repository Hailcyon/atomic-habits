// ignore_for_file: must_be_immutable

part of 'edit_a_habit_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EditAHabitPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EditAHabitPageEvent extends Equatable {}

/// Event that is dispatched when the EditAHabitPage widget is first created.
class EditAHabitPageInitialEvent extends EditAHabitPageEvent {
  @override
  List<Object?> get props => [];
}
