import 'package:event_planning_app/screens/intro_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) =>  IntroScreen(),
      },
    );
  }
}
