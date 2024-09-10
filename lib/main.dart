import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tedx/page/loginpage.dart';
import 'package:tedx/utils/routes.dart';
import 'package:tedx/page/homepage.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme for app light mode and dark mode convert kar sakte hai
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      
      theme: ThemeData(
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      //Temporary 
      //initialRoute: "Loginpage()",
      routes: {
       // change / into homepage to work on home page
       "/": (context) => const Homepage(),
        MyRoutes.homeRoute: (context) => const Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
      );
     
  }
}