import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool isSelected1 = false;
  bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Do you want find a caretaker or apply for the job?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: isSelected1,
                onChanged: (value) => setState(() => isSelected1 = value ?? false),
              ),
              Text("Find caretaker for my pet"),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: isSelected2,
                onChanged: (value) => setState(() => isSelected2 = value ?? false),
              ),
              Text("Find a part-time caretaker job"),
            ],
          ),
          SizedBox(height: 10.0),
          Image.asset("assets/images/selection_dog.png",
              width: 100, height: 100, fit: BoxFit.cover),
          SizedBox(height: 3.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 32.0),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white, primary: Colors.orange),
                  onPressed: () {
                    // Check if any option is selected
                    if (isSelected1 || isSelected2) {
                      // Navigate to the home page
                      Navigator.pushNamed(context, "/home");
                    } else {
                      // Show error message or handle when no option is selected
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("No Option Selected"),
                            content: Text("Please select at least one option."),
                            actions: <Widget>[
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text("Let's go"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
