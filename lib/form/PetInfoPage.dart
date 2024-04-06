import 'package:flutter/material.dart';

class PetInfoPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  // Add controllers for other fields...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Pet Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.withOpacity(0.2),
                  ),
                  child: TextFormField(
                    controller: _petNameController,
                    decoration: InputDecoration(
                      labelText: 'Pet Name',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter pet name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.withOpacity(0.2),
                  ),
                  child: TextFormField(
                    controller: _speciesController,
                    decoration: InputDecoration(
                      labelText: 'Species',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter species';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.withOpacity(0.2),
                  ),
                  child: TextFormField(
                    controller: _breedController,
                    decoration: InputDecoration(
                      labelText: 'Breed',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Add more TextFormFields for other fields...
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process pet information here...
                      // Redirect to '/caretaker' route
                      Navigator.pushReplacementNamed(context, '/caretaker');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Submit'),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
