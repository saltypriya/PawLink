import 'package:flutter/material.dart';
import 'package:pawlink/screens/home_petcare.dart';
import 'package:pawlink/screens/home_petowner.dart';
import 'package:pawlink/screens/login_page.dart';
import 'package:pawlink/screens/selection.dart';
import 'package:pawlink/screens/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: "/login",
      routes: {
        "/": (context) => LoginScreen(),
        "/caretaker": (context) => HomePage_pet(),
        "/job": (context) => HomePage(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignUp(),
        "/selection": (context) => SelectionPage(),
      },
    );
  }
}