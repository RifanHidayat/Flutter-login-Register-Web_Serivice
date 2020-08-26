
import 'package:appservice/layout/Home.dart';
import 'package:appservice/layout/splassScreen.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: SplassScreen(),
    );
  }
}