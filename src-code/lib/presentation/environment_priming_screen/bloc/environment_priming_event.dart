// ignore_for_file: must_be_immutable

part of 'environment_priming_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EnvironmentPriming widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EnvironmentPrimingEvent extends Equatable {}

/// Event that is dispatched when the EnvironmentPriming widget is first created.
class EnvironmentPrimingInitialEvent extends EnvironmentPrimingEvent {
  @override
  List<Object?> get props => [];
}
