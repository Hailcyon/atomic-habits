import 'bloc/home_page_container_bloc.dart';
import 'models/home_page_container_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_image.dart';
import 'package:ahapp3/widgets/app_bar/appbar_title.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:ahapp3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahapp3/presentation/auth.dart';

class HomePageContainerPage extends StatelessWidget {
  HomePageContainerPage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Atomic Habits');
  }

  Widget _userUid() {
    return Text(user?.email ?? "User email");
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text("Sign Out"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      // AppBar(
      //   title: _title(),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildDaysNum(),
              _buildDays(context),
              SizedBox(height: 30.v),
              Text("Habits", style: theme.textTheme.headlineLarge),
              SizedBox(height: 10.v),
              buildHabitButton(
                buttonText: "Go For a Run",
                leftIconPath: ImageConstant.imgIconDirectionsRun,
              ),
              buildHabitButton(
                buttonText: "Go For a Run",
                leftIconPath: ImageConstant.imgIconDirectionsRun,
              ),
              buildHabitButton(
                buttonText: "Go For a Run",
                leftIconPath: ImageConstant.imgIconDirectionsRun,
              ),
              buildHabitButton(
                buttonText: "Go For a Run",
                leftIconPath: ImageConstant.imgIconDirectionsRun,
              ),
              buildHabitButton(
                buttonText: "Go For a Run",
                leftIconPath: ImageConstant.imgIconDirectionsRun,
              ),
              buildHabitButton(
                buttonText: "Go For a Run",
                leftIconPath: ImageConstant.imgIconDirectionsRun,
              ),
              SizedBox(height: 100.v),
              // ElevatedButton(
              //     onPressed: () {},
              //     child: Image.asset(ImageConstant.imgPlusIcon)),
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: Icon(Icons.add_circle_outline_rounded),
              //   label: Text(''),
              // ),
              TextButton(
                child: Icon(Icons.add_rounded, size: 50),
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                    shape: CircleBorder()),
              ),
              SizedBox(height: 300.v),
              _userUid(),
              _signOutButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDaysNum() {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          buildContainer("3", Colors.black, false),
          buildContainer("4", Colors.black, false),
          buildContainer("5", Colors.black, false),
          buildContainer("6", Colors.black, false),
          buildContainer("7", Colors.green, false),
          buildContainer("8", Colors.black, false),
          buildContainer("9", Colors.black, false)
        ]));
  }

  Widget buildContainer(String label, Color outlineColor, bool isLightGreen) {
    return Container(
      width: 42.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
      decoration: BoxDecoration(
        border: Border.all(color: outlineColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(label, style: theme.textTheme.bodyLarge),
      ),
    );
  }

  Widget buildHabitButton({
    required String buttonText,
    required String leftIconPath,
  }) {
    return CustomElevatedButton(
        text: buttonText,
        margin: EdgeInsets.only(right: 8.h),
        rightIcon: Container(
          margin: EdgeInsets.only(left: 30.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgVectorBlack90015x25,
            height: 17.adaptSize,
            width: 17.adaptSize,
          ),
        ),
        leftIcon: Container(
          margin: EdgeInsets.only(right: 30.h),
          child: CustomImageView(
            imagePath: leftIconPath,
            height: 35.v,
            width: 30.h,
          ),
        ),
        buttonStyle: CustomButtonStyles.fillYellowTL10,
        buttonTextStyle: CustomTextStyles.headlineMedium26,
        onPressed: onTapGoForARun);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: _buildAppBar(context),
  //     body: Container(
  //         height: double.infinity,
  //         width: double.maxFinite,
  //         padding: EdgeInsets.all(20),
  //         child: Column(children: [
  //           _buildWidget(context),
  //           SizedBox(height: 6.v),
  //           _buildMon(context),
  //           SizedBox(height: 28.v),
  //           buildCustomElevatedButton(
  //               buttonText: "lbl_go_for_a_run3",
  //               onPressed: () {
  //                 onTapGoForARun(context);
  //               },
  //               leftIconPath: ImageConstant.imgIconDirectionsRun,
  //               rightIconPath: ImageConstant.imgVectorBlack90015x25,
  //            ),
  //           _userUid(),
  //           _signOutButton(),
  //           SizedBox(height: 5.v)

  //         ]
  //       )
  //     )
  //   );
  // }

  // appBar: _buildAppBar(context),
//               body: Container(
//                   width: double.maxFinite,
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
//                   child: Column(children: [
//                     _buildWidget(context),
//                     SizedBox(height: 6.v),
//                     _buildMon(context),
//                     SizedBox(height: 28.v),
//                     CustomElevatedButton(
//                         text: "lbl_go_for_a_run3".tr,
//                         margin: EdgeInsets.only(right: 8.h),
//                         rightIcon: Container(
//                             margin: EdgeInsets.only(left: 30.h),
//                             child: CustomImageView(
//                                 imagePath: ImageConstant.imgVectorBlack90015x25,
//                                 height: 17.adaptSize,
//                                 width: 17.adaptSize)),
//                         leftIcon: Container(
//                             margin: EdgeInsets.only(right: 30.h),
//                             child: CustomImageView(
//                                 imagePath: ImageConstant.imgIconDirectionsRun,
//                                 height: 35.v,
//                                 width: 30.h)),
//                         buttonStyle: CustomButtonStyles.fillYellowTL10,
//                         buttonTextStyle: CustomTextStyles.headlineMedium26,
//                         onPressed: () {
//                           onTapGoForARun(context);
//                         }),
//                     SizedBox(height: 5.v)
//                   ]))));

  static Widget builder(BuildContext context) {
    return BlocProvider<HomePageContainerBloc>(
      create: (context) =>
          HomePageContainerBloc()..add(HomePageContainerInitialEvent()),
      child: HomePageContainerPage(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: Text('Atomic Habits'),
        height: 70.v,
        leadingWidth: 100.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgThreeLinesPic,
            margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10)),
        centerTitle: true,
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCalendarPic,
              margin: EdgeInsets.only(right: 20),
              onTap: () {
                buildCalendar(context);
              })
        ]);
  }

  buildCalendar(BuildContext context) {
    DateTime dateTime = DateTime.now();
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: CupertinoDatePicker(
                backgroundColor: Colors.white,
                initialDateTime: dateTime,
                onDateTimeChanged: (DateTime newTime) {
                  dateTime = newTime;
                },
                use24hFormat: true,
                mode: CupertinoDatePickerMode.date,
              ),
            ));
  }

// return Container(
//       padding: EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  /// Section Widget
  Widget _buildDays(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Mon", style: theme.textTheme.bodyLarge),
          Text("Tue", style: theme.textTheme.bodyLarge),
          Text("Wed", style: theme.textTheme.bodyLarge),
          Text("Thu", style: theme.textTheme.bodyLarge),
          Text("Sat", style: theme.textTheme.bodyLarge),
          Text("Sun", style: theme.textTheme.bodyLarge),
          Text("Mon", style: theme.textTheme.bodyLarge)
        ]));
  }

  /// Navigates to the editAHabitPageScreen when the action is triggered.
  onTapGoForARun() {
    NavigatorService.pushNamed(
      AppRoutes.editAHabitPageScreen,
    );
  }
}


// class HomePageContainerPage extends StatelessWidget {
//   HomePageContainerPage({Key? key}) : super(key: key);

//   //final User? user = Auth().currentUser;

//   static Widget builder(BuildContext context) {
//     return BlocProvider<HomePageContainerBloc>(
//       create: (context) => HomePageContainerBloc()
//         ..add(HomePageContainerInitialEvent()),
//       child: HomePageContainerPage(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomePageContainerBloc, HomePageContainerState>(
//         builder: (context, state) {
//       return SafeArea(
//           child: Scaffold(
//               appBar: _buildAppBar(context),
//               body: Container(
//                   width: double.maxFinite,
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
//                   child: Column(children: [
//                     _buildWidget(context),
//                     SizedBox(height: 6.v),
//                     _buildMon(context),
//                     SizedBox(height: 28.v),
//                     CustomElevatedButton(
//                         text: "lbl_go_for_a_run3".tr,
//                         margin: EdgeInsets.only(right: 8.h),
//                         rightIcon: Container(
//                             margin: EdgeInsets.only(left: 30.h),
//                             child: CustomImageView(
//                                 imagePath: ImageConstant.imgVectorBlack90015x25,
//                                 height: 17.adaptSize,
//                                 width: 17.adaptSize)),
//                         leftIcon: Container(
//                             margin: EdgeInsets.only(right: 30.h),
//                             child: CustomImageView(
//                                 imagePath: ImageConstant.imgIconDirectionsRun,
//                                 height: 35.v,
//                                 width: 30.h)),
//                         buttonStyle: CustomButtonStyles.fillYellowTL10,
//                         buttonTextStyle: CustomTextStyles.headlineMedium26,
//                         onPressed: () {
//                           onTapGoForARun(context);
//                         }),
//                     SizedBox(height: 5.v)
//                   ]))));
//     });
//   }
//   // static Widget builder(BuildContext context) {
//   //   return BlocProvider<HomePageContainerBloc>(
//   //       create: (context) => HomePageContainerBloc(HomePageContainerState(
//   //           homePageContainerModelObj: HomePageContainerModel()))
//   //         ..add(HomePageContainerInitialEvent()),
//   //       child: HomePageContainerPage());
  


  /// Section Widget

