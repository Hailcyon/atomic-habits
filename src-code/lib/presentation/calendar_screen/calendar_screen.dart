import 'bloc/calendar_bloc.dart';
import 'models/calendar_model.dart';
import 'package:ahapp3/core/app_export.dart';
import 'package:ahapp3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:ahapp3/widgets/app_bar/appbar_title_button.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_button.dart';
import 'package:ahapp3/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
 const CalendarScreen({Key? key})
    : super(
        key: key,
      );

 static Widget builder(BuildContext context) {
  return BlocProvider<CalendarBloc>(
    create: (context) => CalendarBloc(CalendarState(
      calendarModelObj: CalendarModel(),
    ))
      ..add(CalendarInitialEvent()),
    child: CalendarScreen(),
  );
 }

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);

  return WillPopScope(
    onWillPop: () async {
      // Navigate to the HomePageContainerScreen when the back button is pressed.
      Navigator.pushReplacementNamed(context, '/home');
      return false; // Prevent the default back button behavior.
    },
    child: SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray100,
        appBar: _buildAppBar(context),
        body: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            return Container(
              height: 281.v,
              width: 374.h,
              margin: EdgeInsets.only(top: 16.v),
              child: TableCalendar(
                locale: 'en_US',
                firstDay: DateTime(DateTime.now().year - 5),
                lastDay: DateTime(DateTime.now().year + 5),
                calendarFormat: CalendarFormat.month,
                rangeSelectionMode: state.rangeSelectionMode,
                startingDayOfWeek: StartingDayOfWeek.monday,
                headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                isTodayHighlighted: true,
                todayTextStyle: TextStyle(
                  color: appTheme.gray900,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                ),
                todayDecoration: BoxDecoration(
                  color: theme.colorScheme.onErrorContainer,
                  borderRadius: BorderRadius.circular(
                    6.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.onPrimary.withOpacity(0.05),
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: Offset(
                        0,
                        1,
                      ),
                    ),
                  ],
                ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: appTheme.gray900,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                ),
                ),
                headerVisible: false,
                rowHeight: 44.v,
                focusedDay: state.focusedDay ?? DateTime.now(),
                rangeStartDay: state.rangeStart,
                rangeEndDay: state.rangeEnd,
                onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(state.selectedDay, selectedDay)) {
                  state.focusedDay = focusedDay;
                  state.selectedDay = selectedDay;
                  state.rangeSelectionMode = RangeSelectionMode.toggledOn;
                }
                },
                onRangeSelected: (start, end, focusedDay) {
                state.focusedDay = focusedDay;
                state.rangeEnd = end;
                state.rangeStart = start;
                state.rangeSelectionMode = RangeSelectionMode.toggledOn;
                },
                onPageChanged: (focusedDay) {
                state.focusedDay = focusedDay;
                },
              ),
            );
          },
        ),
      ),
    ),
  );
 }

 /// Section Widget
 PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 68.h,
    leading: AppbarLeadingIconbutton(
      imagePath: ImageConstant.imgButtons,
      margin: EdgeInsets.only(
        left: 24.h,
        top: 6.v,
        bottom: 6.v,
      ),
    ),
    title: AppbarTitleButton(
      margin: EdgeInsets.only(left: 53.h),
    ),
    actions: [
      AppbarTrailingButton(
        margin: EdgeInsets.only(
          left: 2.h,
          top: 6.v,
          right: 6.h,
        ),
      ),
      AppbarTrailingIconbutton(
        imagePath: ImageConstant.imgComponent2,
        margin: EdgeInsets.only(
          left: 53.h,
          top: 6.v,
          right: 32.h,
        ),
      ),
     ],
   );
 }
}


// import 'bloc/calendar_bloc.dart';
// import 'models/calendar_model.dart';
// import 'package:ahapp3/core/app_export.dart';
// import 'package:ahapp3/widgets/app_bar/appbar_leading_iconbutton.dart';
// import 'package:ahapp3/widgets/app_bar/appbar_title_button.dart';
// import 'package:ahapp3/widgets/app_bar/appbar_trailing_button.dart';
// import 'package:ahapp3/widgets/app_bar/appbar_trailing_iconbutton.dart';
// import 'package:ahapp3/widgets/app_bar/custom_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalendarScreen extends StatelessWidget {
//   const CalendarScreen({Key? key})
//       : super(
//           key: key,
//         );

//   static Widget builder(BuildContext context) {
//     return BlocProvider<CalendarBloc>(
//       create: (context) => CalendarBloc(CalendarState(
//         calendarModelObj: CalendarModel(),
//       ))
//         ..add(CalendarInitialEvent()),
//       child: CalendarScreen(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: appTheme.gray100,
//         appBar: _buildAppBar(context),
//         body: BlocBuilder<CalendarBloc, CalendarState>(
//           builder: (context, state) {
//             return Container(
//               height: 281.v,
//               width: 374.h,
//               margin: EdgeInsets.only(top: 16.v),
//               child: TableCalendar(
//                 locale: 'en_US',
//                 firstDay: DateTime(DateTime.now().year - 5),
//                 lastDay: DateTime(DateTime.now().year + 5),
//                 calendarFormat: CalendarFormat.month,
//                 rangeSelectionMode: state.rangeSelectionMode,
//                 startingDayOfWeek: StartingDayOfWeek.monday,
//                 headerStyle: HeaderStyle(
//                   formatButtonVisible: false,
//                   titleCentered: true,
//                 ),
//                 calendarStyle: CalendarStyle(
//                   outsideDaysVisible: false,
//                   isTodayHighlighted: true,
//                   todayTextStyle: TextStyle(
//                     color: appTheme.gray900,
//                     fontFamily: 'Lexend',
//                     fontWeight: FontWeight.w500,
//                   ),
//                   todayDecoration: BoxDecoration(
//                     color: theme.colorScheme.onErrorContainer,
//                     borderRadius: BorderRadius.circular(
//                       6.h,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: theme.colorScheme.onPrimary.withOpacity(0.05),
//                         spreadRadius: 2.h,
//                         blurRadius: 2.h,
//                         offset: Offset(
//                           0,
//                           1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 daysOfWeekStyle: DaysOfWeekStyle(
//                   weekdayStyle: TextStyle(
//                     color: appTheme.gray900,
//                     fontFamily: 'Lexend',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 headerVisible: false,
//                 rowHeight: 44.v,
//                 focusedDay: state.focusedDay ?? DateTime.now(),
//                 rangeStartDay: state.rangeStart,
//                 rangeEndDay: state.rangeEnd,
//                 onDaySelected: (selectedDay, focusedDay) {
//                   if (!isSameDay(state.selectedDay, selectedDay)) {
//                     state.focusedDay = focusedDay;
//                     state.selectedDay = selectedDay;
//                     state.rangeSelectionMode = RangeSelectionMode.toggledOn;
//                   }
//                 },
//                 onRangeSelected: (start, end, focusedDay) {
//                   state.focusedDay = focusedDay;
//                   state.rangeEnd = end;
//                   state.rangeStart = start;
//                   state.rangeSelectionMode = RangeSelectionMode.toggledOn;
//                 },
//                 onPageChanged: (focusedDay) {
//                   state.focusedDay = focusedDay;
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       leadingWidth: 68.h,
//       leading: AppbarLeadingIconbutton(
//         imagePath: ImageConstant.imgButtons,
//         margin: EdgeInsets.only(
//           left: 24.h,
//           top: 6.v,
//           bottom: 6.v,
//         ),
//       ),
//       title: AppbarTitleButton(
//         margin: EdgeInsets.only(left: 53.h),
//       ),
//       actions: [
//         AppbarTrailingButton(
//           margin: EdgeInsets.only(
//             left: 2.h,
//             top: 6.v,
//             right: 6.h,
//           ),
//         ),
//         AppbarTrailingIconbutton(
//           imagePath: ImageConstant.imgComponent2,
//           margin: EdgeInsets.only(
//             left: 53.h,
//             top: 6.v,
//             right: 32.h,
//           ),
//         ),
//       ],
//     );
//   }
// }
