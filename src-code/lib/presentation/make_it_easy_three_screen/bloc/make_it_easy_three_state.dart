// // ignore_for_file: must_be_immutable

// part of 'make_it_easy_three_bloc.dart';

// /// Represents the state of MakeItEasyThree in the application.
// class MakeItEasyThreeState extends Equatable {
//   MakeItEasyThreeState({this.makeItEasyThreeModelObj});

//   MakeItEasyThreeModel? makeItEasyThreeModelObj;

//   @override
//   List<Object?> get props => [
//         makeItEasyThreeModelObj,
//       ];
//   MakeItEasyThreeState copyWith(
//       {MakeItEasyThreeModel? makeItEasyThreeModelObj}) {
//     return MakeItEasyThreeState(
//       makeItEasyThreeModelObj:
//           makeItEasyThreeModelObj ?? this.makeItEasyThreeModelObj,
//     );
//   }
// }


// ignore_for_file: must_be_immutable

part of 'make_it_easy_three_bloc.dart';

/// Represents the state of MakeItEasyThree in the application.
class MakeItEasyThreeState extends Equatable {
  MakeItEasyThreeState({
    this.runController,
    this.timeController,
    this.libertyparkController,
    // this.implementationIntEditModelObj,
    this.makeItEasyThreeModelObj,
  });

  TextEditingController? runController;

  TextEditingController? timeController;

  TextEditingController? libertyparkController;

  MakeItEasyThreeModel? makeItEasyThreeModelObj;

  @override
  List<Object?> get props => [
        runController,
        timeController,
        libertyparkController,
        makeItEasyThreeModelObj,
      ];
  MakeItEasyThreeState copyWith({
    TextEditingController? runController,
    TextEditingController? timeController,
    TextEditingController? libertyparkController,
    MakeItEasyThreeModel? makeItEasyThreeModelObj,
  }) {
    return MakeItEasyThreeState(
      runController: runController ?? this.runController,
      timeController: timeController ?? this.timeController,
      libertyparkController:
          libertyparkController ?? this.libertyparkController,
      makeItEasyThreeModelObj:
          makeItEasyThreeModelObj ?? this.makeItEasyThreeModelObj,
    );
  }
}
