import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

Future<QuerySnapshot> getHabitLawDetails(String habitId) {
  return firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitId).collection('HabitLaws').get();
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

  // have auto generated id
  Future<void> deleteHabit(String habitId) async {
    await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .delete();
  }

  // Future<int> updateStreak(String habitId) async {
  //   DocumentReference habitRef = FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(uid)
  //       .collection('Habits')
  //       .doc(habitId);

  //   DocumentSnapshot habitDoc = await getHabitDetails(habitId);
  //   Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;

  //   List<dynamic> streak = List<dynamic>.from(data['streak'] ?? []);
  //   streak = ['2024-02-25 14:38:35.112230']; //test for adding sunday in

  //   if (streak.isNotEmpty && streak.last == _formattedDate(DateTime.now())) {
  //     return streak.length; // Exit the function, no need to update streak
  //   }

  //   List<String> days = List<String>.from(data['days'] ?? []);

  //   //int currentDayIndex = DateTime.now().weekday - 1; // 1 for Monday, 2 for Tuesday, etc.
  //   DateTime currentDate = DateTime.now();
  //   int currentDayIndex = currentDate.weekday;

  //   // Calculate the last expected date based on the current day and the days array
  //   int lastExpectedDayIndex = (currentDayIndex == 0) ? 6 : currentDayIndex - 1; // Index of yesterday
  //   //String lastExpectedDay = days[lastExpectedDayIndex];

  //   String lastExpectedDayName = days[lastExpectedDayIndex];


  //   // Calculate the difference in days between the current day and the last expected day
  //   int daysUntilLastExpectedDay = currentDayIndex - lastExpectedDayIndex;

  //   // Adjust the difference to get the last occurrence of the last expected day before the current date
  //   if (daysUntilLastExpectedDay < 0) {
  //     daysUntilLastExpectedDay += 7; // Add 7 days to get the last occurrence of the last expected day
  //   }

  //   // Subtract the difference from the current date to get the last occurrence of the last expected day
  //   DateTime lastExpectedDay = currentDate.subtract(Duration(days: daysUntilLastExpectedDay));

  //   print('Last occurrence of $lastExpectedDayName before $currentDate: $lastExpectedDay');

  //   // Check if the streak array is empty
  //   if (streak.isEmpty) {
  //     // If streak array is empty, add the current date
  //     streak.add(DateTime.now().toString());
  //   } else {
  //     // Get the last date in the streak array
  //     String lastDateInStreak = streak.last;

  //     print("FORMATTED LAST DATE IN STREAK");
  //     print(_formattedDate(DateTime.parse(lastDateInStreak)));
  //     //print(lastDateInStreak);

  //     print("LAST EXPECTED DAY");
  //     print(lastExpectedDay);

  //     // Check if the last date in the streak array matches the last expected date
  //     if (lastDateInStreak == lastExpectedDay) {
  //       print("IN == HERE");
  //       // If it matches, continue the streak by adding the current date
  //       streak.add(DateTime.now().toString());
  //     } else {
  //       print("IN != HERE");
  //       // If it doesn't match, reset the streak with the current date
  //       streak = [DateTime.now().toString()];
  //     }
  //   }

  //   // Update the streak array in the habit document
  //   await habitRef.update({'streak': streak});

  //   print(streak);

  //   return streak.length;
  // }

  Future<int> updateStreak(String habitId) async {
    DocumentReference habitRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId);

    DocumentSnapshot habitDoc = await getHabitDetails(habitId);
    Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;

    List<dynamic> streak = List<dynamic>.from(data['streak'] ?? []);
    // streak = ['2024-02-25']; //test for sunday the 25th of Feb

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Get the name of the last expected day from the 'days' array
    List<String> days = List<String>.from(data['days'] ?? []);
    
    int currentDayIndex = currentDate.weekday - 1; // 1 for Monday, 2 for Tuesday, etc.
    int lastExpectedDayIndex = (currentDayIndex == 0) ? 6 : currentDayIndex - 1; // Index of yesterday
    String lastExpectedDayName = days[lastExpectedDayIndex];

    Map<String, int> daysMap = {
      'monday': 0,
      'tuesday': 1,
      'wednesday': 2,
      'thursday': 3,
      'friday': 4,
      'saturday': 5,
      'sunday': 6,
    };

    //print("LAST EXPECTED DATE SHOULD BE SUNDAY: $lastExpectedDayName");

    //int c = currentDate.weekday;
    int? lastExpectedDayInd = daysMap[lastExpectedDayName];


    //print("lastExpectedDayIndex is $lastExpectedDayIndex");

    //print("currentdate is, and currrentDayIndex is $currentDayIndex, and lastexpdayind is $lastExpectedDayInd");

    // Calculate the difference in days between the current day and the last expected day
    int daysUntilLastExpectedDay = currentDayIndex - (lastExpectedDayInd ?? 0);

    // Adjust the difference to get the last occurrence of the last expected day before the current date
    if (daysUntilLastExpectedDay < 0) {
      daysUntilLastExpectedDay += 7; // Add 7 days to get the last occurrence of the last expected day
    }

    // Subtract the difference from the current date to get the last occurrence of the last expected day
    DateTime lastExpectedDay = currentDate.subtract(Duration(days: daysUntilLastExpectedDay));

    //print('Last occurrence of $lastExpectedDayName before $currentDate: $lastExpectedDay');

    // Format the last expected day to match the format in the streak array
    String formattedLastExpectedDay = _formattedDate(lastExpectedDay);
    String formattedToday = _formattedDate(currentDate);

    //if habit was already completed
    if (streak.isNotEmpty && streak.last == formattedToday) {
      return streak.length; // Exit the function, no need to update streak
    }

    //print("FORMATTED LAST DAY IS $formattedLastExpectedDay");

    //if last completed date was not the last expected day
    if (streak.isNotEmpty && streak.last != formattedLastExpectedDay) {
      streak = [formattedToday];
      await habitRef.update({'streak': streak});
      return streak.length; // Exit the function, no need to update streak
    }

    // If streak array is empty or the last date in the streak array doesn't match the last expected day
    streak.add(formattedToday);

    // Update the streak array in the habit document
    await habitRef.update({'streak': streak});

    //print(streak);

    return streak.length;
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