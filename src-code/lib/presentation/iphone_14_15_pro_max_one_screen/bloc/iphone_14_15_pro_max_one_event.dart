// ignore_for_file: must_be_immutable

part of 'iphone_14_15_pro_max_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Iphone1415ProMaxOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class Iphone1415ProMaxOneEvent extends Equatable {}

/// Event that is dispatched when the Iphone1415ProMaxOne widget is first created.
class Iphone1415ProMaxOneInitialEvent extends Iphone1415ProMaxOneEvent {
  @override
  List<Object?> get props => [];
}
