import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx/page/contact.dart';

import 'package:tedx/page/loginpage.dart';
import 'package:tedx/page/pasteventspage.dart';
import 'package:tedx/page/recruitmentpage.dart';
import 'package:tedx/utils/routes.dart';
import 'package:tedx/page/homepage.dart';
import 'package:tedx/utils/theme_notifier.dart';
import 'package:tedx/widgets/themes.dart';

void main(){
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),  // Provide the ThemeNotifier
      ],
      child: const MyApp(),
    ),);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(

      
      //theme for app light mode and dark mode convert kar sakte hai
      
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      
     
      
      //Temporary 
      //initialRoute: "Loginpage()",
      routes: {
       // change / into homepage to work on home page
       "/": (context) => const Homepage(),
        MyRoutes.homeRoute: (context) => const Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.RecruitmentRoute:(context) => const RecruitmentPage(),
        MyRoutes.ContactRoute:(context) => const Contact(),
        MyRoutes.PastRoute:(context)=> const PastEventsPage(),
      },
      );
     
  }
}