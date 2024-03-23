import 'package:flutter/material.dart';
import 'package:pawlink/screens/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void _login(BuildContext context, String username, String password) {
    // Check if username and password match certain values
    if (username == "admin" && password == "test") {
      // Navigate to selection page if login is successful
      Navigator.pushNamed(context, "/selection");
    } else {
      // Show error message or handle invalid login
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Credentials"),
            content: Text("Please enter correct username and password."),
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
  }


  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';

    return Material(
      child: Column(
        children: [
          SizedBox(height: 40.0),
          SizedBox(height: 30.0),
          Text(
            "Welcome back",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Please enter your account here",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 30.0),
          Image.asset(
            "assets/images/dog.png",
            width: 100, // Set desired width
            height: 100, // Set desired height
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle "Forgot Password" functionality here
                      },
                      child: Text("Forgot Password?"),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.deepPurple,
                  ),
                  onPressed: () {
                    _login(context, username, password);
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
