import 'package:flutter/material.dart';

class CaretakerProfilePage extends StatelessWidget {
  final String name;
  final String description;

  CaretakerProfilePage({required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    // Implement the UI to display details of the caretaker and the pets they are taking care of
    return Scaffold(
      appBar: AppBar(
        title: Text('Caretaker Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Description: $description',
              style: TextStyle(fontSize: 18.0),
            ),
            // Add more details here as needed
          ],
        ),
      ),
    );
  }
}
