import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
          children: [


            SizedBox(
              height: 40.0,
            ),

            // Text(
            //   "Sign in",
            //   style: TextStyle(
            //     fontSize: 16,
            //   ),
            // ),



            SizedBox(
              height: 30.0,
            ),

            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 10.0,
            ),

            Text(
              "Please enter your account here",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Image.asset("assets/images/3817259.jpg",
              width: 100, // Set desired width
              height: 100, // Set desired height
              fit: BoxFit.cover,),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Full Name",
                      labelText: "Full Name",
                    ),
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      labelText: "Email",
                    ),
                  ),

                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),

                  // SizedBox(height: 10.0),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {
                  //         // Handle "Forgot Password" functionality here
                  //       },
                  //       child: Text("Forgot Password?"),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 30.0,
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.deepOrangeAccent
                      ),
                      onPressed: () {},
                      child: Text("Sign Up")),






                ],),
            )
          ],
        )
    );
  }
}
