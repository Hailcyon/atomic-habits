// ignore_for_file: must_be_immutable

part of 'make_it_obvious_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MakeItObviousTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MakeItObviousTwoEvent extends Equatable {}

/// Event that is dispatched when the MakeItObviousTwo widget is first created.
class MakeItObviousTwoInitialEvent extends MakeItObviousTwoEvent {
  @override
  List<Object?> get props => [];
}
