// ignore_for_file: must_be_immutable

part of 'rd_law_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RdLawPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RdLawPageEvent extends Equatable {}

/// Event that is dispatched when the RdLawPage widget is first created.
class RdLawPageInitialEvent extends RdLawPageEvent {
  @override
  List<Object?> get props => [];
}
