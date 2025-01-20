import 'package:event_planning_app/screens/intro_screen.dart';
import 'package:event_planning_app/theme/dark_theme.dart';
import 'package:event_planning_app/theme/light_theme.dart';
import 'package:event_planning_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BaseTheme theme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      
      darkTheme: darkTheme.themeData,
      theme: theme.themeData,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) =>  IntroScreen(),
      },
    );
  }
}
