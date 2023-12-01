// ignore_for_file: must_be_immutable

part of 'make_it_obvious_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MakeItObviousOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MakeItObviousOneEvent extends Equatable {}

/// Event that is dispatched when the MakeItObviousOne widget is first created.
class MakeItObviousOneInitialEvent extends MakeItObviousOneEvent {
  @override
  List<Object?> get props => [];
}
