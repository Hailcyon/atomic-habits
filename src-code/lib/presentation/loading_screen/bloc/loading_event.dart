// ignore_for_file: must_be_immutable

part of 'loading_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Loading widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoadingEvent extends Equatable {}

/// Event that is dispatched when the Loading widget is first created.
class LoadingInitialEvent extends LoadingEvent {
  @override
  List<Object?> get props => [];
}
