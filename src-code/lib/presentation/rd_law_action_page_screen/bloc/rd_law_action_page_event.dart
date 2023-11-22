// ignore_for_file: must_be_immutable

part of 'rd_law_action_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RdLawActionPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RdLawActionPageEvent extends Equatable {}

/// Event that is dispatched when the RdLawActionPage widget is first created.
class RdLawActionPageInitialEvent extends RdLawActionPageEvent {
  @override
  List<Object?> get props => [];
}
