// ignore_for_file: must_be_immutable

part of 'implementation_int_edit_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ImplementationIntEdit widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ImplementationIntEditEvent extends Equatable {}

/// Event that is dispatched when the ImplementationIntEdit widget is first created.
class ImplementationIntEditInitialEvent extends ImplementationIntEditEvent {
  @override
  List<Object?> get props => [];
}
