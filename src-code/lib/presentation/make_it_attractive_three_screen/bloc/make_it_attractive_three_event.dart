// ignore_for_file: must_be_immutable

part of 'make_it_attractive_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MakeItAttractiveThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MakeItAttractiveThreeEvent extends Equatable {}

/// Event that is dispatched when the MakeItAttractiveThree widget is first created.
class MakeItAttractiveThreeInitialEvent extends MakeItAttractiveThreeEvent {
  @override
  List<Object?> get props => [];
}
