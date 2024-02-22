import 'package:cloud_firestore/cloud_firestore.dart';

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

    firestoreInstance.collection('Users').doc(uid).collection('Habits').doc('Habit1').set({"date": "2023"});
  }

  Future<void> saveHabit(String habitName) async {
    await firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitName).set({
      "date": "2024"
    });
  }

  Future<void> saveHabitLaw(String habitName, String habitLawName, String habitLawDetails) async {
    await firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitName).set({
       habitLawName: habitLawDetails
    });
  }

  // String getHabits(String habitDocName) {
  //   String habit_name;
  //   habit_name = firestoreInstance.collection('Users').doc(uid).collection('Habits').doc(habitDocName).id;
  //   return habit_name;
  // }

  Future<List<String>> getHabitNames() async {
    List<String> habitNames = [];

    QuerySnapshot querySnapshot = await firestoreInstance.collection('Users').doc(uid).collection('Habits').get();

    for (var doc in querySnapshot.docs) {
      habitNames.add(doc.id); // doc.id is the document ID, which is the habit name
    }

    return habitNames;
  }
}
