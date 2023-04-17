//08.april.2023
import 'package:flutter/material.dart';

import 'firebase_realtime_database.dart';

class Aprildatabasescreen extends StatefulWidget {
  const Aprildatabasescreen({super.key});

  @override
  State<Aprildatabasescreen> createState() => _AprildatabasescreenState();
}

class _AprildatabasescreenState extends State<Aprildatabasescreen> {
  final firebaseRD = FirebaseRealtimeDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text(
          "Real Time Database",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Click to Add Data to firebase",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () {
                  print("write");
                  firebaseRD.writeData("Varun Write Data");
                },
                child: Icon(Icons.add),
              ),
              const Text(
                "Click to Read Listner to firebase",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () {
                  firebaseRD.readData();
                },
                child: Icon(Icons.add),
              ),
              const Text(
                "Click to Remove Listner to firebase",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () {
                  firebaseRD.cancelRead();
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
