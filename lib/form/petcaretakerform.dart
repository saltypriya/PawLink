import 'package:flutter/material.dart';

class PetCaretakerInfoPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Caretaker Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  'Pet Caretaker Info',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                buildTextInputField(_nameController, 'Name'),
                SizedBox(height: 10),
                buildTextInputField(_professionController, 'Profession'),
                SizedBox(height: 10),
                buildTextInputField(_availabilityController, 'Availability'),
                SizedBox(height: 10),
                buildTextInputField(_experienceController, 'Experience'),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitForm(context); // Pass the BuildContext
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple, // Background color
                      onPrimary: Colors.white, // Text color
                    ),
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextInputField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.deepPurple.withOpacity(0.2),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter $labelText';
          }
          return null;
        },
      ),
    );
  }

  void _submitForm(BuildContext context) {
    String name = _nameController.text;
    String profession = _professionController.text;
    String availability = _availabilityController.text;
    String experience = _experienceController.text;

    // You can perform further actions here if needed
    print('Name: $name');
    print('Profession: $profession');
    print('Availability: $availability');
    print('Experience: $experience');

    // Navigate to the "/job" route
    Navigator.pushNamed(context, '/job');
  }
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => PetCaretakerInfoPage(),
      '/job': (context) => JobPage(), // Define JobPage route
    },
  ));
}

class JobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Page'),
      ),
      body: Center(
        child: Text('This is the Job Page'),
      ),
    );
  }
}
