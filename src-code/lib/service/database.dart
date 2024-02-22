import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // final firestoreInstance = FirebaseFirestore.instance.collection('Users');
  final firestoreInstance = FirebaseFirestore.instance;

  initializeUser() async {
    // Set the user document with the UID
    // DocumentReference userDoc = usersCollection.doc(uid);
    // // Example: Initializing the 'habits' sub-collection with a sample habit
    // await userDoc.collection('habits');

    // usersCollection.add({
    //   "name": "testname",
    // });

    // firestoreInstance.collection('Users').doc(uid).collection('Habits').doc('Habit1').set({"date": "2023"});
    await firestoreInstance.collection('Users').doc(uid).set({
      // Set initial data for the user document. For example, registration date.
      "registrationDate": FieldValue.serverTimestamp(),
    });
  }

  // Future<String> getNextHabitId() async {
  //   // Retrieve all habit documents for the current user
  //   QuerySnapshot snapshot = await firestoreInstance.collection('Users').doc(uid).collection('Habits').get();

  //   // Count the documents and add one to get the next habit ID
  //   int nextId = snapshot.docs.length + 1;

  //   // Return the new habit ID as a string like 'habit1', 'habit2', ...
  //   return 'habit$nextId';
  // }

  // Future<void> saveHabit(String habitName, List<String> days, TimeOfDay startTime, TimeOfDay endTime, String place) async {
  //   // Format the times as strings
  //   String startTimeStr = '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
  //   String endTimeStr = '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';

  //   await firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitName).set({
  //     "name": habitName,
  //     "days": days,
  //     "start time": startTimeStr,
  //     "end time": endTimeStr,
  //     "place": place,
  //   });
  // }

  //save new habit with auto generated id
  Future<String> saveHabit(String habitName, List<String> days, TimeOfDay startTime, TimeOfDay endTime, String place) async {
    // Format the times as strings
    String startTimeStr = '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
    String endTimeStr = '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';

    // Let Firestore generate the ID automatically
    DocumentReference ref = await firestoreInstance.collection('Users').doc(uid).collection('Habits').add({
      "name": habitName,
      "days": days,
      "start time": startTimeStr,
      "end time": endTimeStr,
      "place": place,
    });

    // Return the generated document ID
    return ref.id;
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
                  'id': doc.id,  // Get the document ID
                  'name': doc.data()['name'] as String,  // Get the habit name
                })
            .toList());
  }

  // // get habitname in ascending when worring about current day of week
  // // before adding Habit class
  // Stream<List<String>> getHabitsAscending(String dayOfWeek) {
  //   return firestoreInstance
  //     .collection('Users')
  //     .doc(uid)
  //     .collection('Habits')
  //     .where("days", arrayContains: dayOfWeek) // Use arrayContains to filter by day
  //     .orderBy("name")
  //     .snapshots()
  //     .map((snapshot) => snapshot.docs
  //       // .map((doc) => doc.id) // Assuming the habit name is the document ID
  //       .map((doc) => doc.data()['name'] as String)
  //       .toList());
  // }

  // // func before having auto genrated id, take habitname as id
  // Future<void> deleteHabit(String habitName) async {
  //   await firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitName).delete();
  // }

  // have auto generated id
  Future<void> deleteHabit(String habitId) async {
    await firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitId).delete();
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
    return firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitId).get();
  }

  // // before having auto generated doc id and creating Habit class
  // Future<void> updateHabitName(String oldHabitName, String newHabitName) async {
  //   return firestoreInstance
  //     .collection('Users')
  //     .doc(uid) // Assuming you're organizing habits by user ID
  //     .collection('Habits') // Assuming a subcollection for habits
  //     .doc(oldHabitName) // Document ID is the old habit name
  //     .update({'name': newHabitName}) // Update the 'name' field
  //     // .catchError((error) => print("Failed to update habit name: $error"))
  //     ;
  // }

}





// get habitname in ascending without worring about current day of week
  // Stream<List<String>> getHabitsAscending(String dayOfWeek) {
  //   return firestoreInstance
  //       .collection('Users')
  //       .doc(uid)
  //       .collection('Habits')
  //       .orderBy("name")
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((doc) => doc.id) // Assuming the habit name is the document ID
  //           .toList());
  // }

 // String getHabits(String habitDocName) {
  //   String habit_name;
  //   habit_name = firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitDocName).id;
  //   return habit_name;
  // }

  // Future<List<String>> getHabitNames() async {
  //   List<String> habitNames = [];
  //   QuerySnapshot querySnapshot = await firestoreInstance.collection('Users').doc(uid).collection('Habits').get();
  //   for (var doc in querySnapshot.docs) {
  //     habitNames.add(doc.id); // doc.id is the document ID, which is the habit name
  //   }
  //   return habitNames;
  // }