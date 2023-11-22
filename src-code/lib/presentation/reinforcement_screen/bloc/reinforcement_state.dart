// ignore_for_file: must_be_immutable

part of 'reinforcement_bloc.dart';

/// Represents the state of Reinforcement in the application.
class ReinforcementState extends Equatable {
  ReinforcementState({
    this.editTextController,
    this.reinforcementModelObj,
  });

  TextEditingController? editTextController;

  ReinforcementModel? reinforcementModelObj;

  @override
  List<Object?> get props => [
        editTextController,
        reinforcementModelObj,
      ];
  ReinforcementState copyWith({
    TextEditingController? editTextController,
    ReinforcementModel? reinforcementModelObj,
  }) {
    return ReinforcementState(
      editTextController: editTextController ?? this.editTextController,
      reinforcementModelObj:
          reinforcementModelObj ?? this.reinforcementModelObj,
    );
  }
}
