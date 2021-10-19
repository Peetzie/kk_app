import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
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
        stream: FirebaseFirestore.instance.collection("testing").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final docData = snapshot.data!.docs[index].data();
                final dateTime = DateTime.now();
                return ListTile(
                  title: Text(dateTime.toString()),
                );
              });
        },
      ),
    );
  }
}