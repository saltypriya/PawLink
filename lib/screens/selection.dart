import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What do you want to do?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            RadioListTile(
              title: Text('Find a caretaker for my pet'),
              value: 'find_caretaker',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('Find a part-time caretaker job'),
              value: 'find_job',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value as String?;
                });
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {
                    // Navigate to corresponding page based on the selected option
                    if (selectedOption == 'find_caretaker') {
                      Navigator.pushNamed(context, '/ownerform');
                    } else if (selectedOption == 'find_job') {
                      Navigator.pushNamed(context, '/caretakerform');
                    }
                  } else {
                    // Show error message if no option is selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select an option'),
                      ),
                    );
                  }
                },
                child: Text('Let\'s go'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
