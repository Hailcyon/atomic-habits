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


  Future<String> saveHabit(String habitName, List<String> days, String startTime, String endTime, String place, String iconPath) async {
    // Directly use startTime and endTime as they're already strings
    DocumentReference ref = await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .add({
      "name": habitName,
      "days": days,
      "start time": startTime,
      "end time": endTime,
      "place": place,
      "icon path": iconPath, // 新增字段保存图标路径
      "streak": [],
    });

    return ref.id;
  }


Future<String> saveHabitLaw(String habitId, int habitNum, String habitLawNum, String habitLaw) async {

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
                  'iconPath': doc.data()['icon path'] as String,
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

    List<String> streakList = List<String>.from(data['streak'] ?? []).map((e) => e.toString()).toList();
    List<String> days = List<String>.from(data['days'] ?? []); // Example: ['thursday', 'friday', 'saturday']

    String formattedChosenDate = DateFormat('yyyy-MM-dd').format(chosenDateTime);

    // Ensure all valid dates are included in the streak list
    if (!streakList.contains(formattedChosenDate) && days.contains(DateFormat('EEEE').format(chosenDateTime).toLowerCase())) {
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


int calculateStreakCount(List<String> streakList, List<String> validDays) {
    if (streakList.isEmpty) return 0;

    // Convert string dates to DateTime objects for easier comparison
    List<DateTime> streakDates = streakList.map((date) => DateFormat('yyyy-MM-dd').parse(date)).toList();

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
                lastDate = currentDate; // Update the lastDate to current as we're moving backwards
            } else {
                // If it's a valid day but not in sequence, break the streak
                break;
            }
        }
    }
    return streakCount;
}

bool isNextValidHabitDay(DateTime prevDate, DateTime nextDate, List<String> validDays) {
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
    return validDays.contains(DateFormat('EEEE').format(nextDate).toLowerCase());
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

}