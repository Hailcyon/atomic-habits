// ignore_for_file: must_be_immutable

part of 'make_it_easy_two_bloc.dart';

// import 'package:flutter/material.dart';

/// Abstract class for all events that can be dispatched from the
///MakeItEasyOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MakeItEasyTwoEvent extends Equatable {}

/// Event that is dispatched when the MakeItEasyOne widget is first created.
class MakeItEasyTwoInitialEvent extends MakeItEasyTwoEvent {
  @override
  List<Object?> get props => [];
}
