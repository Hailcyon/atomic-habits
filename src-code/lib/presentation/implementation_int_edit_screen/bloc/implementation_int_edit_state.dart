// ignore_for_file: must_be_immutable

part of 'implementation_int_edit_bloc.dart';

/// Represents the state of ImplementationIntEdit in the application.
class ImplementationIntEditState extends Equatable {
  ImplementationIntEditState({
    this.runController,
    this.timeController,
    this.libertyparkController,
    this.implementationIntEditModelObj,
  });

  TextEditingController? runController;

  TextEditingController? timeController;

  TextEditingController? libertyparkController;

  ImplementationIntEditModel? implementationIntEditModelObj;

  @override
  List<Object?> get props => [
        runController,
        timeController,
        libertyparkController,
        implementationIntEditModelObj,
      ];
  ImplementationIntEditState copyWith({
    TextEditingController? runController,
    TextEditingController? timeController,
    TextEditingController? libertyparkController,
    ImplementationIntEditModel? implementationIntEditModelObj,
  }) {
    return ImplementationIntEditState(
      runController: runController ?? this.runController,
      timeController: timeController ?? this.timeController,
      libertyparkController:
          libertyparkController ?? this.libertyparkController,
      implementationIntEditModelObj:
          implementationIntEditModelObj ?? this.implementationIntEditModelObj,
    );
  }
}
