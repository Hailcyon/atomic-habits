// ignore_for_file: must_be_immutable

part of 'th_law_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ThLawPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ThLawPageEvent extends Equatable {}

/// Event that is dispatched when the ThLawPage widget is first created.
class ThLawPageInitialEvent extends ThLawPageEvent {
  @override
  List<Object?> get props => [];
}
