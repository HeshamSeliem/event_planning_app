import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_app/firebase/firebase_manager.dart';
import 'package:event_planning_app/firebase_options.dart';
import 'package:event_planning_app/screens/create_event/create_event.dart';
import 'package:event_planning_app/screens/home/home_screen.dart';
import 'package:event_planning_app/provider/my_provider.dart';
import 'package:event_planning_app/screens/auth/forget_password.dart';
import 'package:event_planning_app/screens/auth/login_screen.dart';
import 'package:event_planning_app/screens/auth/register_screen.dart';
import 'package:event_planning_app/screens/intro_screen.dart';
import 'package:event_planning_app/theme/dark_theme.dart';
import 'package:event_planning_app/theme/light_theme.dart';
import 'package:event_planning_app/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 
  runApp(  
    ChangeNotifierProvider(
      create: (BuildContext context) => MyProvider(),
      child: EasyLocalization(
        supportedLocales: [
          Locale('en'),
           Locale('ar')
           ],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: const MyApp()),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BaseTheme theme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    var provider = Provider.of<MyProvider>(context); // this line is to get the provider and use it in the theme mode
    return MaterialApp(
      // this is the context of the app translated
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
     // to here
      darkTheme: darkTheme.themeData,
      theme: theme.themeData,
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName:(context) => RegisterScreen(),
        ForgetPassword.routeName:(context) => ForgetPassword(),
        HomeScreen.routeName:(context) => HomeScreen(),
        CreateEvent.routeName:(context) => CreateEvent()
      },
    );
  }
}
