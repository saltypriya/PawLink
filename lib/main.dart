import 'package:flutter/material.dart';
import 'package:pawlink/screens/home_page.dart';
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
        "/": (context) => LoginPage(),
        "/home": (context) => HomeePage(),
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/selection": (context) => SelectionPage(),
      },
    );
  }
}
