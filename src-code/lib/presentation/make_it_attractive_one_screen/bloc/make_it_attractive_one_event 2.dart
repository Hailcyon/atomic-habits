// ignore_for_file: must_be_immutable

part of 'make_it_attractive_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MakeItAttractiveOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MakeItAttractiveOneEvent extends Equatable {}

/// Event that is dispatched when the MakeItAttractiveOne widget is first created.
class MakeItAttractiveOneInitialEvent extends MakeItAttractiveOneEvent {
  @override
  List<Object?> get props => [];
}
