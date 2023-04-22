import 'package:aprilseven/firebase_realtime_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Jsonscreen extends StatefulWidget {
  const Jsonscreen({super.key});

  @override
  State<Jsonscreen> createState() => _JsonscreenState();
}

class _JsonscreenState extends State<Jsonscreen> {
  final _userDR = FirebaseDatabase.instance.ref("users");
  final firebaseRD = FirebaseRealtimeDatabase();
  TextEditingController first = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: first,
              keyboardType: TextInputType.name,
            ),
            TextButton(
                onPressed: () {
                  firebaseRD.writeData(first.text);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_alt),
                    Text(" Press to save the Data")
                  ],
                )),
            StreamBuilder(
                stream: _userDR.onValue,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    Map? data = snapshot.data?.snapshot.value as Map?;
                    List items = [];
                    data?.forEach(
                        (index, data) => items.add({"key": index, ...data}));
                    return ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(items[index]["name"]);
                        });
                  }
                  return const CircleAvatar();
                }))
          ],
        ),
      ),
    );
  }
}
