// ignore_for_file: must_be_immutable

part of 'implementation_int_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ImplementationInt widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ImplementationIntEvent extends Equatable {}

/// Event that is dispatched when the ImplementationInt widget is first created.
class ImplementationIntInitialEvent extends ImplementationIntEvent {
  @override
  List<Object?> get props => [];
}
