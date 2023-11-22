// ignore_for_file: must_be_immutable

part of 'customize_save_habit_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CustomizeSaveHabit widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CustomizeSaveHabitEvent extends Equatable {}

/// Event that is dispatched when the CustomizeSaveHabit widget is first created.
class CustomizeSaveHabitInitialEvent extends CustomizeSaveHabitEvent {
  @override
  List<Object?> get props => [];
}
