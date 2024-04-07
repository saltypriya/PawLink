import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: [
                _buildMessageBubble("Hello there! How can I help you?", true),
                _buildMessageBubble("Hi! I need a caretaker for my pet.", false),
                _buildMessageBubble("Sure! When do you need one?", true),
                _buildMessageBubble("Tomorrow evening would be great.", false),
              ],
            ),
          ),
          _buildTextInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message, bool isSentByUser) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSentByUser ? Colors.white : Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputField() {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Send message logic
            },
          ),
        ],
      ),
    );
  }
}

class CaretakerProfilePage extends StatelessWidget {
  final String name;
  final String description;
  final String availability;
  final String location;
  final String dateAvailable;

  CaretakerProfilePage({
    required this.name,
    required this.description,
    required this.availability,
    required this.location,
    required this.dateAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caretaker Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/caretaker_image.jpg'), // Replace with actual image asset
            ),
            SizedBox(height: 20.0),
            Text(
              'Name:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Availability:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              availability,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Location:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              location,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Date Available:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              dateAvailable,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Pets under Care:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with the actual number of pets
                itemBuilder: (context, index) {
                  // You can populate the list with actual pets data
                  return ListTile(
                    leading: Icon(Icons.pets),
                    title: Text('Pet ${index + 1}'),
                    subtitle: Text('Species: Dog'), // Replace with actual pet data
                    // Add onTap to navigate to pet details page if needed
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()), // Navigate to ChatPage
                    );
                  },
                  child: Text('Chat'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to payment screen
                  },
                  child: Text('Payment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CaretakerProfilePage(
      name: 'John Doe', // Replace with actual caretaker name
      description: 'Experienced pet lover with 5+ years of caregiving experience.', // Replace with actual description
      availability: 'Full-time', // Replace with actual availability from gigs
      location: 'Gurugram, Haryana', // Replace with actual location from gigs
      dateAvailable: 'April 10, 2024', // Replace with actual date available from gigs
    ),
    routes: {
      '/chat': (context) => ChatPage(), // Define route for ChatPage
    },
  ));
}
