// ignore_for_file: must_be_immutable

part of 'iphone_14_15_pro_max_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Iphone1415ProMaxTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class Iphone1415ProMaxTwoEvent extends Equatable {}

/// Event that is dispatched when the Iphone1415ProMaxTwo widget is first created.
class Iphone1415ProMaxTwoInitialEvent extends Iphone1415ProMaxTwoEvent {
  @override
  List<Object?> get props => [];
}
