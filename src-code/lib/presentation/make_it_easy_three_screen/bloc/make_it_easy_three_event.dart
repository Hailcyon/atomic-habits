// ignore_for_file: must_be_immutable

part of 'make_it_easy_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MakeItEasyThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MakeItEasyThreeEvent extends Equatable {}

/// Event that is dispatched when the MakeItEasyThree widget is first created.
class MakeItEasyThreeInitialEvent extends MakeItEasyThreeEvent {
  @override
  List<Object?> get props => [];
}

