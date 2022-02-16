import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constants.dart';
import 'package:food_delivery_app/screen/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: primaryBGColor,
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
