import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tedx/page/loginpage.dart';
import 'package:tedx/utils/routes.dart';
import 'package:tedx/page/homepage.dart';
import 'package:tedx/widgets/themes.dart';

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
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      
     
      
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