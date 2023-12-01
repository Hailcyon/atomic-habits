// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [add_a_new_habit_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddANewHabitModel extends Equatable {
  AddANewHabitModel() {}

  AddANewHabitModel copyWith() {
    return AddANewHabitModel();
  }

  @override
  List<Object?> get props => [];
}
