// ignore_for_file: must_be_immutable

part of 'implementation_int_bloc.dart';

/// Represents the state of ImplementationInt in the application.
class ImplementationIntState extends Equatable {
  ImplementationIntState({
    this.habitTextController,
    this.habitTimeTextController,
    this.habitLocationTextController,
    this.implementationIntModelObj,
  });

  TextEditingController? habitTextController;

  TextEditingController? habitTimeTextController;

  TextEditingController? habitLocationTextController;

  ImplementationIntModel? implementationIntModelObj;

  @override
  List<Object?> get props => [
        habitTextController,
        habitTimeTextController,
        habitLocationTextController,
        implementationIntModelObj,
      ];
  ImplementationIntState copyWith({
    TextEditingController? habitTextController,
    TextEditingController? habitTimeTextController,
    TextEditingController? habitLocationTextController,
    ImplementationIntModel? implementationIntModelObj,
  }) {
    return ImplementationIntState(
      habitTextController: habitTextController ?? this.habitTextController,
      habitTimeTextController:
          habitTimeTextController ?? this.habitTimeTextController,
      habitLocationTextController:
          habitLocationTextController ?? this.habitLocationTextController,
      implementationIntModelObj:
          implementationIntModelObj ?? this.implementationIntModelObj,
    );
  }
}
