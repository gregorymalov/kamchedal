import 'package:flutter/material.dart';
import 'package:kamchedal/page1.dart';

class Kamchedal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'КамчЕДАл Отзывы',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.green,
          primaryColor: Colors.green,
          textTheme: TextTheme(title: TextStyle(color: Colors.white))),
      home: Page1(),
    );
  }
}
