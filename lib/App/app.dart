import 'package:flutter/material.dart';
import 'package:tedx/views/Homeview.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tedx',
      home: HomeView(),
    );
  }
}