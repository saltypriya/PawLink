import 'package:flutter/material.dart';
import 'package:pawlink/screens/home_page.dart';
import 'package:pawlink/screens/login_page.dart';
import 'package:pawlink/screens/selection.dart';
import 'package:pawlink/screens/signup_page.dart';

// import 'package:google_fonts/google_fonts.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepOrange
        // fontFamily: GoogleFonts.latoText
      ),
      // home: HomeePage(),

      initialRoute: "/selection",
      routes: {
        "/": (Context)=> LoginPage(),
        "/home": (Context)=> HomeePage(),
        "/login": (Context)=> LoginPage(),
        "/signup": (Context)=> SignupPage(),
        "/selection": (Context)=> SelectionPage(),
      },
    );
  }
}
