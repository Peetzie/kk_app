
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: const Text("lort"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Test mig"),
      ),
    );
  }
}

