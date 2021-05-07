import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_redesign/widgets/bottom_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blue,
        primaryColor: Colors.red,
        fontFamily: 'GoogleProductSans', 
      ),
      routes: {
        '/': (ctx) => BottomNavBar(),
      },
    );
  }
}
