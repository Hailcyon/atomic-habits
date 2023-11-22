// ignore_for_file: must_be_immutable

part of 'implementation_int_edit_bloc.dart';

/// Represents the state of ImplementationIntEdit in the application.
class ImplementationIntEditState extends Equatable {
  ImplementationIntEditState({
    this.habitNameController,
    this.habitTimeController,
    this.habitLocationController,
    this.implementationIntEditModelObj,
  });

  TextEditingController? habitNameController;

  TextEditingController? habitTimeController;

  TextEditingController? habitLocationController;

  ImplementationIntEditModel? implementationIntEditModelObj;

  @override
  List<Object?> get props => [
        habitNameController,
        habitTimeController,
        habitLocationController,
        implementationIntEditModelObj,
      ];
  ImplementationIntEditState copyWith({
    TextEditingController? habitNameController,
    TextEditingController? habitTimeController,
    TextEditingController? habitLocationController,
    ImplementationIntEditModel? implementationIntEditModelObj,
  }) {
    return ImplementationIntEditState(
      habitNameController: habitNameController ?? this.habitNameController,
      habitTimeController: habitTimeController ?? this.habitTimeController,
      habitLocationController:
          habitLocationController ?? this.habitLocationController,
      implementationIntEditModelObj:
          implementationIntEditModelObj ?? this.implementationIntEditModelObj,
    );
  }
}
