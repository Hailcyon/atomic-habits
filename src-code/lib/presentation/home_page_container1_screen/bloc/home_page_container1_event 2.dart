// ignore_for_file: must_be_immutable

part of 'home_page_container1_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomePageContainer1 widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomePageContainer1Event extends Equatable {}

/// Event that is dispatched when the HomePageContainer1 widget is first created.
class HomePageContainer1InitialEvent extends HomePageContainer1Event {
  @override
  List<Object?> get props => [];
}
