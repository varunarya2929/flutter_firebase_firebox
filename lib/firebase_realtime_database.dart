//8.april.2023
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeDatabase {
  StreamSubscription<DatabaseEvent>? subscription;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  StreamSubscription<DatabaseEvent>? onChildAddedSS;
  StreamSubscription<DatabaseEvent>? onChildChangedSS;
  StreamSubscription<DatabaseEvent>? onChildREmovedSS;

  void writeData(String name) async {
    final key = FirebaseDatabase.instance.ref("users").push().key;
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$key");
    print("added on key1");
    await ref.set({
      "name": name,
      "age": 12,
      "address": {"line1": "jalndhar", " state": "punjab"}
    });
    print("added on key $key");
  }

  void readData() {
    print(" welcome");
    DatabaseReference userRef = FirebaseDatabase.instance.ref('users');
    onChildAddedSS = userRef.onChildAdded.listen((event) {
      print("onchildadded");
      print("event =  ${event.snapshot.key}");
    });
    onChildChangedSS = userRef.onChildChanged.listen((event) {
      print("onchildchanged");
    });
    onChildREmovedSS = userRef.onChildRemoved.listen((event) {
      print("onchildremoved");
    });
  }

  void cancelRead() {
    subscription?.cancel;
    onChildAddedSS?.cancel;
    onChildChangedSS?.cancel;
    onChildREmovedSS?.cancel;
  }
}
