// ignore_for_file: must_be_immutable

part of 'make_it_attractive_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MakeItAttractiveTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MakeItAttractiveTwoEvent extends Equatable {}

/// Event that is dispatched when the MakeItAttractiveTwo widget is first created.
class MakeItAttractiveTwoInitialEvent extends MakeItAttractiveTwoEvent {
  @override
  List<Object?> get props => [];
}
