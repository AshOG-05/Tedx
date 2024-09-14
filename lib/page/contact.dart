import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),  // Use the theme's title style
        ),
        backgroundColor: theme.primaryColor,),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              
            
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(CupertinoIcons.photo_camera),  // Use the appropriate icon
                  const SizedBox(width: 20),  // Add some space between icon and text
                  const Text("Instagram:" ,style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 25,),
             Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(CupertinoIcons.play),  // Use the appropriate icon
                  const SizedBox(width: 20),  // Add some space between icon and text
                  const Text("Youtube:" ,style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 25,),
             Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(CupertinoIcons.f_cursive_circle),  // Use the appropriate icon
                  const SizedBox(width: 20),  // Add some space between icon and text
                  const Text("Facebook:" ,style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(CupertinoIcons.xmark_rectangle_fill),  // Use the appropriate icon
                  const SizedBox(width: 20),  // Add some space between icon and text
                  const Text("X:" ,style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}