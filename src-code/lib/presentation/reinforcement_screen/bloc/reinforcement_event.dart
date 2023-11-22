// ignore_for_file: must_be_immutable

part of 'reinforcement_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Reinforcement widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReinforcementEvent extends Equatable {}

/// Event that is dispatched when the Reinforcement widget is first created.
class ReinforcementInitialEvent extends ReinforcementEvent {
  @override
  List<Object?> get props => [];
}
