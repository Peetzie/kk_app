import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kk_app/DetailScreen.dart';

class SecondScreen extends StatelessWidget {
  CollectionReference Titles = FirebaseFirestore.instance.collection("Titles");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            FirebaseFirestore.instance
                .collection("testing")
                .add({"timestamp": Timestamp.fromDate(DateTime.now())}),
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        // Bruges til at læse Value fra Titles
        stream: Titles.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,) {
          if (!snapshot.hasData) {
            return const Text("Henter data.. Vent venligst..");
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                // Kan læse value dataet fra FireStore
                final docData = snapshot.data!.docs[index]["titel"];
                final dateTime = docData.toString();
                return ListTile(
                  title: Text(dateTime.toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen()
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }

}
