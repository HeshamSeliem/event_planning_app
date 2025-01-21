import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_app/screens/intro_screen.dart';
import 'package:event_planning_app/theme/dark_theme.dart';
import 'package:event_planning_app/theme/light_theme.dart';
import 'package:event_planning_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en'),
         Locale('ar')
         ],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BaseTheme theme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      // this is the context of the app translated
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
     // to here
      darkTheme: darkTheme.themeData,
      theme: theme.themeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
      },
    );
  }
}
