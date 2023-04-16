import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid);
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("users");

  // Future updateUserData(String fullName, String email) async {
  //   ref = FirebaseDatabase.instance.ref("users/"+uid);
  //   return await ref
  //     .update({
  //       "name": fullName,
  //       "dob": email,
  //     });
  // }

  Future WriteUserData(String fullName, String dob) async {
    ref = FirebaseDatabase.instance.ref("users/" + uid);
    return await ref.set({
      "name": fullName,
      "dob": dob,
    });
  }

  Future gettingUserData() async {
    ref = FirebaseDatabase.instance.ref();
    var snapshot = await ref.child('users/' + uid).get();
    if (snapshot.exists) {
      print(snapshot.value);
      return snapshot.value;
    } else {
      print('No data available.');
    }
  }
}
