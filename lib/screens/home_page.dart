import 'package:flutter/material.dart';

class HomeePage extends StatelessWidget {
  // const ({super.key});
  final int days = 45;
  final String name = "Mama69";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Prabhu Fitness"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome $name, Light Weight $days"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
