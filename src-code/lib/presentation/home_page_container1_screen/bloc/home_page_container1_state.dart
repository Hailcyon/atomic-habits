// ignore_for_file: must_be_immutable

part of 'home_page_container1_bloc.dart';

/// Represents the state of HomePageContainer1 in the application.
class HomePageContainer1State extends Equatable {
  HomePageContainer1State({this.homePageContainer1ModelObj});

  HomePageContainer1Model? homePageContainer1ModelObj;

  @override
  List<Object?> get props => [
        homePageContainer1ModelObj,
      ];
  HomePageContainer1State copyWith(
      {HomePageContainer1Model? homePageContainer1ModelObj}) {
    return HomePageContainer1State(
      homePageContainer1ModelObj:
          homePageContainer1ModelObj ?? this.homePageContainer1ModelObj,
    );
  }
}
