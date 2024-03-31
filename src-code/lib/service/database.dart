import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as Math;

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // final firestoreInstance = FirebaseFirestore.instance.collection('Users');
  final firestoreInstance = FirebaseFirestore.instance;

  initializeUser() async {
    // firestoreInstance.collection('Users').doc(uid).collection('Habits').doc('Habit1').set({"date": "2023"});
    await firestoreInstance.collection('Users').doc(uid).set({
      // Set initial data for the user document. For example, registration date.
      "registrationDate": FieldValue.serverTimestamp(),
    });
  }

  //save new habit with auto generated id
  Future<String> saveHabit(String habitName, List<String> days,
      TimeOfDay startTime, TimeOfDay endTime, String place) async {
    // Format the times as strings
    String startTimeStr =
        '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
    String endTimeStr =
        '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';

    // Let Firestore generate the ID automatically
    DocumentReference ref = await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .add({
      "name": habitName,
      "days": days,
      "start time": startTimeStr,
      "end time": endTimeStr,
      "place": place,
      "streak": [],
    });

    // Return the generated document ID
    return ref.id;
  }

  Future<String> saveHabitLaw(
      String habitId, int habitNum, String habitLawNum, String habitLaw) async {
    DocumentReference ref = await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .collection('HabitLaws')
        .add({
      "habitNum": habitNum,
      "habitLawNum": habitLawNum,
      "habitLaw": habitLaw,
    });

    return ref.id;
  }

// Future<QuerySnapshot> getHabitLawDetails(String habitId) {
//   return firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitId).collection('HabitLaws').get();
// }

  Stream<List<Map<String, dynamic>>> getHabitLawDetailsStream(String habitId) {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .collection('HabitLaws')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => {
                  'id': doc.id,
                  'habitNum': doc.data()['habitNum'] as int,
                  'habitLawNum': doc.data()['habitLawNum'] as String,
                  'habitLaw': doc.data()['habitLaw'] as String,
                })
            .toList());
  }

  Stream<List<Map<String, String>>> getHabitsAscending(String dayOfWeek) {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .where("days", arrayContains: dayOfWeek)
        .orderBy("name")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => {
                  'id': doc.id, // Get the document ID
                  'name': doc.data()['name'] as String, // Get the habit name
                })
            .toList());
  }

  Stream<List<Map<String, String>>> getSuggestedHabits() {
    return firestoreInstance
        .collection('SuggestedHabits')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => {
                  'id': doc.id, // Get the document ID, which is the habit name
                })
            .toList());
  }

  Stream<List<Map<String, dynamic>>> getAllUserHabits() {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => {
                  'name': doc.data()['name'] as String, // Get the habit name
                  'streak':
                      doc.data()['streak'] as List<dynamic>, //Get habit streak
                  'days': doc.data()['days'] as List<dynamic>,
                })
            .toList());
  }

  // have auto generated id
  Future<void> deleteHabit(String habitId) async {
    await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .delete();
  }

  Future<int> updateStreak(String habitId, DateTime chosenDateTime) async {
    DocumentReference habitRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId);

    DocumentSnapshot habitDoc = await habitRef.get();
    Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;

    List<String> streakList = List<String>.from(data['streak'] ?? [])
        .map((e) => e.toString())
        .toList();
    List<String> days = List<String>.from(
        data['days'] ?? []); // Example: ['thursday', 'friday', 'saturday']

    String formattedChosenDate =
        DateFormat('yyyy-MM-dd').format(chosenDateTime);

    // Ensure all valid dates are included in the streak list
    if (!streakList.contains(formattedChosenDate) &&
        days.contains(
            DateFormat('EEEE').format(chosenDateTime).toLowerCase())) {
      streakList.add(formattedChosenDate);
    }

    // Always sort the streak list to maintain chronological order
    streakList.sort();

    // Now we determine the continuous streak length based on the latest sequence of valid dates
    int newStreakCount = calculateStreakCount(streakList, days);

    // Update the streak in Firestore if necessary
    if (!ListEquality().equals(streakList, data['streak'])) {
      await habitRef.update({'streak': streakList});
    }

    return newStreakCount; // Return the length of the continuous streak
  }

  //***I moved the commented out methods to the bottom***

  int calculateStreakCount(List<String> streakList, List<String> validDays) {
    if (streakList.isEmpty) return 0;

    // Convert string dates to DateTime objects for easier comparison
    List<DateTime> streakDates =
        streakList.map((date) => DateFormat('yyyy-MM-dd').parse(date)).toList();

    // Start from the end of the list (the most recent date)
    DateTime lastDate = streakDates.last;
    int streakCount = 1; // Streak starts with the latest date

    for (int i = streakDates.length - 2; i >= 0; i--) {
      DateTime currentDate = streakDates[i];

      // Calculate the difference in days and check if the current date is a valid habit day
      int diff = lastDate.difference(currentDate).inDays;
      String dayOfWeek = DateFormat('EEEE').format(currentDate).toLowerCase();

      if (diff > 7) {
        // More than a week difference means automatic break
        break;
      } else if (validDays.contains(dayOfWeek)) {
        // If the current date is part of the habit days and is in sequence
        if (isNextValidHabitDay(currentDate, lastDate, validDays)) {
          streakCount++;
          lastDate =
              currentDate; // Update the lastDate to current as we're moving backwards
        } else {
          // If it's a valid day but not in sequence, break the streak
          break;
        }
      }
    }
    return streakCount;
  }

  bool isNextValidHabitDay(
      DateTime prevDate, DateTime nextDate, List<String> validDays) {
    // Calculate the difference in days
    int diff = nextDate.difference(prevDate).inDays;

    // Iterate through the days between prevDate and nextDate
    for (int i = 1; i <= diff; i++) {
      DateTime tempDate = prevDate.add(Duration(days: i));
      String dayOfWeek = DateFormat('EEEE').format(tempDate).toLowerCase();

      // If we hit a valid habit day before reaching nextDate, it breaks the streak
      if (validDays.contains(dayOfWeek) && tempDate.isBefore(nextDate)) {
        return false;
      }
    }

    // If the nextDate is a valid habit day (and we didn't find another habit day before it),
    // then it's considered continuous.
    return validDays
        .contains(DateFormat('EEEE').format(nextDate).toLowerCase());
  }

  String _formattedDate(DateTime dateTime) {
    return dateTime.toString().split(' ')[0]; // Extract YYYY-MM-DD format
  }

  Future<void> updateHabitName(String habitId, String newHabitName) async {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId) // Use the habit ID instead of the old name
        .update({'name': newHabitName}); // Update the 'name' field
  }

  Future<void> updateStartTime(String habitId, String newStartTime) async {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId) // Use the habit ID instead of the old name
        .update({'start time': newStartTime}); // Update the 'name' field
  }

  Future<void> updateEndTime(String habitId, String newEndTime) async {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId) // Use the habit ID instead of the old name
        .update({'end time': newEndTime}); // Update the 'name' field
  }

  Future<DocumentSnapshot> getHabitDetails(String habitId) {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .get();
  }

  // Future<int> updateStreak(String habitId, DateTime chosenDateTime) async {
  //   DocumentReference habitRef = FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(uid)
  //       .collection('Habits')
  //       .doc(habitId);

  //   DocumentSnapshot habitDoc = await getHabitDetails(habitId);
  //   Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;

  //   List<dynamic> streak = List<dynamic>.from(data['streak'] ?? []);
  //   //streak = ['2024-02-25']; //test for sunday the 25th of Feb

  //   // Get the current date
  //   DateTime currentDate = DateTime.now();

  //   // Get the name of the last expected day from the 'days' array
  //   List<String> days = List<String>.from(data['days'] ?? []);

  //   int currentDayIndex = currentDate.weekday - 1; // 1 for Monday, 2 for Tuesday, etc.
  //   int lastExpectedDayIndex = (currentDayIndex == 0) ? 6 : currentDayIndex - 1; // Index of yesterday
  //   String lastExpectedDayName = days[lastExpectedDayIndex];

  //   Map<String, int> daysMap = {
  //     'monday': 0,
  //     'tuesday': 1,
  //     'wednesday': 2,
  //     'thursday': 3,
  //     'friday': 4,
  //     'saturday': 5,
  //     'sunday': 6,
  //   };

  //   //print("LAST EXPECTED DATE SHOULD BE SUNDAY: $lastExpectedDayName");

  //   //int c = currentDate.weekday;
  //   int? lastExpectedDayInd = daysMap[lastExpectedDayName];

  //   //print("lastExpectedDayIndex is $lastExpectedDayIndex");

  //   //print("currentdate is, and currrentDayIndex is $currentDayIndex, and lastexpdayind is $lastExpectedDayInd");

  //   // Calculate the difference in days between the current day and the last expected day
  //   int daysUntilLastExpectedDay = currentDayIndex - (lastExpectedDayInd ?? 0);

  //   // Adjust the difference to get the last occurrence of the last expected day before the current date
  //   if (daysUntilLastExpectedDay < 0) {
  //     daysUntilLastExpectedDay += 7; // Add 7 days to get the last occurrence of the last expected day
  //   }

  //   // Subtract the difference from the current date to get the last occurrence of the last expected day
  //   DateTime lastExpectedDay = currentDate.subtract(Duration(days: daysUntilLastExpectedDay));

  //   //print('Last occurrence of $lastExpectedDayName before $currentDate: $lastExpectedDay');

  //   // Format the last expected day to match the format in the streak array
  //   String formattedLastExpectedDay = _formattedDate(lastExpectedDay);
  //   String formattedToday = _formattedDate(currentDate);

  //   //if habit was already completed
  //   if (streak.isNotEmpty && streak.last == formattedToday) {
  //     return streak.length; // Exit the function, no need to update streak
  //   }

  //   //print("FORMATTED LAST DAY IS $formattedLastExpectedDay");

  //   //if last completed date was not the last expected day
  //   if (streak.isNotEmpty && streak.last != formattedLastExpectedDay) {
  //     streak = [formattedToday];
  //     await habitRef.update({'streak': streak});
  //     return streak.length; // Exit the function, no need to update streak
  //   }

  //   // If streak array is empty or the last date in the streak array doesn't match the last expected day
  //   streak.add(formattedToday);

  //   // Update the streak array in the habit document
  //   await habitRef.update({'streak': streak});

  //   //print(streak);

  //   return streak.length;
  // }

//   Future<int> updateStreak(String habitId, DateTime chosenDateTime) async {
//     DocumentReference habitRef = FirebaseFirestore.instance
//         .collection('Users')
//         .doc(uid)
//         .collection('Habits')
//         .doc(habitId);

//     DocumentSnapshot habitDoc = await getHabitDetails(habitId);
//     Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;

//     List<dynamic> streak = List<dynamic>.from(data['streak'] ?? []);
//     //streak = ['2024-02-25']; //test for sunday the 25th of Feb

// //-----------------------------------------------------------------
//     // Get the name of the last expected day from the 'days' array
//     List<String> days = List<String>.from(data['days'] ?? []);

//     // 将日期转换为YYYY-MM-DD格式的字符串
//     String formattedChosenDate = DateFormat('yyyy-MM-dd').format(chosenDateTime);

//     // Transform the 'days' into comparable weekday numbers (1 = Monday, 7 = Sunday)
//     Map<String, int> daysOfWeek = {
//         'monday': 1, 'tuesday': 2, 'wednesday': 3, 'thursday': 4, 'friday': 5, 'saturday': 6, 'sunday': 7,
//     };
//     List<int> daysAsNumbers = days.map((day) => daysOfWeek[day]!).toList();

//     // 检查chosenDateTime是否是设定的执行日期之一
//     String chosenDayOfWeek = DateFormat('EEEE').format(chosenDateTime).toLowerCase(); // 获取星期几，例如 'thursday'
//     if (!days.contains(chosenDayOfWeek)) {
//         // 如果不是执行日期，则不更新streak
//         return streak.length;
//     }

//     // 如果是执行日期，更新streak
//     if (streak.isEmpty || !streak.contains(formattedChosenDate)) {
//         // 如果streak为空，或者streak中不包含chosenDateTime，就添加chosenDateTime并更新Firebase
//         if (streak.isNotEmpty) {
//             // 检查上一个日期是否是连续的
//             String lastDateStr = streak.last;
//             DateTime lastDate = DateFormat('yyyy-MM-dd').parse(lastDateStr);
//             DateTime expectedDate = getNextExpectedDate(lastDate, daysAsNumbers);
//             if (chosenDateTime.difference(expectedDate).inDays == 0 && days.contains(DateFormat('EEEE').format(expectedDate).toLowerCase())) {
//                 // 如果是连续的，并且也是执行日期，则保持streak
//                 streak.add(formattedChosenDate);
//             } else {
//                 // 如果不连续，则重置streak
//                 streak = [formattedChosenDate];
//             }
//         } else {
//             // 如果streak是空的，就开始新的streak
//             streak = [formattedChosenDate];
//         }

//         await habitRef.update({'streak': streak});
//     }
// //-----------------------------------------------------------------
//     return streak.length;
//   }

//   DateTime getNextExpectedDate(DateTime lastDate, List<int> daysAsNumbers) {
//     DateTime nextDate = lastDate.add(Duration(days: 1));
//     while (!daysAsNumbers.contains(nextDate.weekday)) {
//         nextDate = nextDate.add(Duration(days: 1)); // Add one day until it matches one of the expected days.
//     }
//     return nextDate;
// }

//   // Assume streakList is already sorted and contains all valid dates
// int calculateStreakCount(List<String> streakList, List<String> validDays) {
//     if (streakList.isEmpty) return 0;

//     int longestStreak = 0;
//     int currentStreak = 1; // Start with 1 because the last date itself starts a streak
//     DateTime currentDate = DateFormat('yyyy-MM-dd').parse(streakList.last);

//     // Start from the second to last date and move backwards
//     for (int i = streakList.length - 2; i >= 0; i--) {
//         DateTime prevDate = DateFormat('yyyy-MM-dd').parse(streakList[i]);
//         if (isNextValidHabitDay(prevDate, currentDate, validDays)) {
//             currentStreak++;
//             currentDate = prevDate; // Move current date back for the next comparison
//         } else {
//             // Break in the streak, check if it's the longest one yet
//             longestStreak = Math.max(longestStreak, currentStreak);
//             currentStreak = 1; // Reset the current streak
//             currentDate = prevDate; // Reset the current date to the break point
//         }
//     }

//     // Final comparison, outside the loop
//     longestStreak = Math.max(longestStreak, currentStreak);

//     return longestStreak;
// }
}
