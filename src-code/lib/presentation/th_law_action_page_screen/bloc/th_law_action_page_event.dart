// ignore_for_file: must_be_immutable

part of 'th_law_action_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ThLawActionPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ThLawActionPageEvent extends Equatable {}

/// Event that is dispatched when the ThLawActionPage widget is first created.
class ThLawActionPageInitialEvent extends ThLawActionPageEvent {
  @override
  List<Object?> get props => [];
}
