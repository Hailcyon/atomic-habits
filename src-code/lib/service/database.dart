import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final firestoreInstance = FirebaseFirestore.instance;

  initializeUser() async {
    await firestoreInstance.collection('Users').doc(uid).set({
      // Set initial data for the user document. For example, registration date.
      "registrationDate": FieldValue.serverTimestamp(),
    });
  }

  Future<List<Map<String, String>>> getUserHabits() async {
    try {
      QuerySnapshot habitSnapshot = await firestoreInstance
          .collection('Users')
          .doc(uid)
          .collection('Habits')
          .get();

      List<Map<String, String>> habits = habitSnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return {
          'id': doc.id,
          'name':
              data['name'] is String ? data['name'] as String : 'Unnamed Habit',
        };
      }).toList();

      return habits;
    } catch (e) {
      print("Error fetching habits: $e");
      return [];
    }
  }

  Future<int> getUserHabitsCount() async {
    try {
      QuerySnapshot habitSnapshot = await firestoreInstance
          .collection('Users')
          .doc(uid)
          .collection('Habits')
          .get();

      return habitSnapshot.size; // Return the number of habits
    } catch (e) {
      print("Error fetching habits: $e");
      return 0; // Return 0 in case of error
    }
  }

  Future<DateTime> getHabitStartDate(String habitId) async {
    DocumentSnapshot habitDoc = await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .get();

    if (habitDoc.exists) {
      Map<String, dynamic> habitData = habitDoc.data() as Map<String, dynamic>;
      String startDateStr = habitData['create date'];
      DateTime startDate = DateFormat('yyyy-MM-dd').parse(startDateStr);
      return startDate;
    } else {
      throw Exception('Habit not found');
    }
  }

  Future<List<int>> getHabitDaysOfWeek(String habitId) async {
    DocumentSnapshot habitDoc = await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .get();

    if (habitDoc.exists) {
      Map<String, dynamic> habitData = habitDoc.data() as Map<String, dynamic>;
      List<dynamic> daysStrList = habitData['days'] ?? [];

      List<int> daysOfWeek = daysStrList
          .map((day) {
            switch (day) {
              case "monday":
                return DateTime.monday;
              case "tuesday":
                return DateTime.tuesday;
              case "wednesday":
                return DateTime.wednesday;
              case "thursday":
                return DateTime.thursday;
              case "friday":
                return DateTime.friday;
              case "saturday":
                return DateTime.saturday;
              case "sunday":
                return DateTime.sunday;
              default:
                return null;
            }
          })
          .where((day) => day != null)
          .cast<int>()
          .toList();

      return daysOfWeek;
    } else {
      throw Exception('Habit not found');
    }
  }

  List<String> convertDaysIntToString(List<int> daysOfWeekInt) {
    Map<int, String> dayMapping = {
      DateTime.monday: "monday",
      DateTime.tuesday: "tuesday",
      DateTime.wednesday: "wednesday",
      DateTime.thursday: "thursday",
      DateTime.friday: "friday",
      DateTime.saturday: "saturday",
      DateTime.sunday: "sunday",
    };

    List<String> daysOfWeekStr =
        daysOfWeekInt.map((day) => dayMapping[day]!).toList();
    return daysOfWeekStr;
  }

  Future<int> getHabitStreakCount(String habitId) async {
    DocumentSnapshot habitDoc = await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .get();

    if (habitDoc.exists) {
      Map<String, dynamic> habitData = habitDoc.data() as Map<String, dynamic>;
      List<int> daysOfWeekInt = await getHabitDaysOfWeek(habitId);

      List<String> daysOfWeekStr = convertDaysIntToString(daysOfWeekInt);

      List<String> streakList = List<String>.from(habitData['streak'] ?? []);

      int streakCount = calculateStreakCount(streakList, daysOfWeekStr);

      return streakCount;
    } else {
      throw Exception('Habit not found');
    }
  }

  Future<List<String>> getSkippedDates(String habitId) async {
    DocumentSnapshot habitDoc = await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .get();

    if (habitDoc.exists) {
      Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;
      List<String> skipped = List<String>.from(data['skipped'] ?? []);
      return skipped;
    } else {
      throw Exception('Habit not found');
    }
  }

  Future<List<String>> getStreakDates(String habitId) async {
    DocumentSnapshot habitDoc = await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .get();

    if (habitDoc.exists) {
      Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;
      List<String> streak = List<String>.from(data['streak'] ?? []);
      return streak;
    } else {
      throw Exception('Habit not found');
    }
  }

  Future<void> editHabit(
      String habitId,
      String habitName,
      List<String> days,
      String startTime,
      String endTime,
      String place,
      String iconPath) async {
    try {
      await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .update({
          "name": habitName,
          "days": days,
          "start time": startTime,
          "end time": endTime,
          "place": place,
          "icon path": iconPath,
        });
    } catch (e) {
      throw Exception('Failed to edit habit: $e');
    }
  }

  Future<String> saveHabit(
      String habitName,
      List<String> days,
      String startTime,
      String endTime,
      String place,
      String iconPath,
      String createDate) async {
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
      "icon path": iconPath,
      "streak": [],
      "skipped": [],
      "create date": createDate,
    });

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
                  'id': doc.id,
                  'name': doc.data()['name'] as String,
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
                  'id': doc.id,
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
                  'name': doc.data()['name'] as String,
                  'streak':
                      doc.data()['streak'] as List<dynamic>,
                  'days': doc.data()['days'] as List<dynamic>,
                  'id': doc.id,
                })
            .toList());
  }

  Stream<List<String>> getSuggestedHabitLawActions(
      String habitName, String habitLaw, String habitLawAction) {
    return firestoreInstance
        .collection('SuggestedHabits')
        .doc(habitName)
        .collection('HabitLaws')
        .doc(habitLaw)
        .collection('HabitLawActions')
        .doc(habitLawAction)
        .snapshots()
        .map((snapshot) {
      var data = snapshot.data();
      if (data != null && data.containsKey('suggestions')) {
        return List<String>.from(data['suggestions'] as List<dynamic>);
      } else {
        return [];
      }
    });
  }


  Future<void> deleteHabit(String habitId) async {
    await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .delete();
  }


  Future<void> streakSkipInEditMode(String habitId, List<String> selectedDaysOfWeek) async {
    DocumentSnapshot habitDoc = await firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitId).get();

    if (habitDoc.exists) {
      Map<String, dynamic> habitData = habitDoc.data() as Map<String, dynamic>; // 进行类型转换
      List<dynamic> streakList = habitData['streak'] ?? [];
      List<dynamic> skippedList = habitData['skipped'] ?? [];
      List<String> daysOfWeek = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"];

      // Convert selectedDaysOfWeek to corresponding weekday numbers
    List<int> selectedWeekdays = selectedDaysOfWeek.map((day) => daysOfWeek.indexOf(day)+1).toList();

      // Filter streak list based on the new selectedDaysOfWeek
    List<dynamic> updatedStreakList = streakList.where((date) {
      DateTime dt = DateTime.parse(date);
      return selectedWeekdays.contains(dt.weekday); // Check if the date's weekday is in selectedWeekdays
    }).toList();

      List<dynamic> updatedSkippedList = skippedList.where((date) {
        DateTime dt = DateTime.parse(date);
        return !selectedWeekdays.contains(dt.weekday);
      }).toList();

      // Update the habit document
      await firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitId).update({
        'streak': updatedStreakList,
        'skipped': updatedSkippedList,
      });
    }
  }




  /**
   * Add chosen date to selected habit's streak list,
   * delete chosen date in selected habit's skipped list
   */
  Future<void> markHabitAsCompleted(String habitId, DateTime date) async {
    String dateString = DateFormat('yyyy-MM-dd').format(date);
    DocumentReference habitRef = firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId);

    DocumentSnapshot habitDoc = await habitRef.get();
    if (!habitDoc.exists) return;

    Map<String, dynamic> data = habitDoc.data() as Map<String, dynamic>;
    List<dynamic> currentStreak = data['streak'] ?? [];
    List<dynamic> currentSkipped = data['skipped'] ?? [];

    // update streak list
    if (!currentStreak.contains(dateString)) {
      await habitRef.update({
        'streak': FieldValue.arrayUnion([dateString])
      });
    }

    // update skipped list
    if (currentSkipped.contains(dateString)) {
      await habitRef.update({
        'skipped': FieldValue.arrayRemove([dateString])
      });
    }
  }

  /**
   * Add chosen date to the selected habit's skipped list
   */
  Future<void> addSkipDate(String habitId, DateTime date) async {
    String dateString = DateFormat('yyyy-MM-dd').format(date);
    DocumentReference habitRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId);

    await habitRef.update({
      'skipped': FieldValue.arrayUnion([dateString])
    });
  }

  /**
   * Loop through every habit of the user on specific day of week,
   * which is all habits in the chosen date home page,
   * return a list that stores the habits in the current homepageand 
   * and their corresponding skip status.
   */
  Future<List<Map<String, dynamic>>> getHabitsWithSkipStatus(
      String dayOfWeek, DateTime currentDate) async {
    String currentDateStr = DateFormat('yyyy-MM-dd').format(currentDate);

    QuerySnapshot snapshot = await firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .where("days", arrayContains: dayOfWeek)
        .orderBy("name")
        .get();

    // a list to store habits and their corresponding skip status
    List<Map<String, dynamic>> habitsWithStatus = [];

    // loop through every habit of the user on specific day of week
    // which is all habits in the chosen date home page
    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // check if chosen date in is the habit's skipped list
      bool isSkipped =
          (data['skipped'] as List<dynamic>?)?.contains(currentDateStr) ??
              false;

      habitsWithStatus.add({
        'id': doc.id,
        'name': data['name'],
        'isSkipped': isSkipped,
      });
    }
    return habitsWithStatus;
  }

  /**
   * When skip a habit on a chosen date, remove the chosen date
   * from the sreak list of the selected habit.
   */
  Future<void> skipHabitDate(String habitId, DateTime chosenDateTime) async {
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
    String formattedChosenDate =
        DateFormat('yyyy-MM-dd').format(chosenDateTime);

    // Remove the chosen date from the streak list
    streakList.remove(formattedChosenDate);

    // Update the streak list in Firestore
    await habitRef.update({'streak': streakList});
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


  Future<void> updateHabitName(String habitId, String newHabitName) async {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .update({'name': newHabitName});
  }

  Future<void> updateStartTime(String habitId, String newStartTime) async {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .update({'start time': newStartTime});
  }

  Future<void> updateEndTime(String habitId, String newEndTime) async {
    return firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Habits')
        .doc(habitId)
        .update({'end time': newEndTime});
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
