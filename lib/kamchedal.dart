import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:kamchedal/page1.dart';
import 'package:kamchedal/page2.dart';

class Kamchedal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'КамчЕДАл Отзывы',
      theme: ThemeData(
          primaryColor: Colors.lightGreen,
          textTheme: TextTheme(title: TextStyle(color: Colors.white))),
      home: Page1(),
    );
  }
}
