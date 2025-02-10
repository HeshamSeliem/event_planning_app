import 'package:event_planning_app/firebase/firebase_manager.dart';
import 'package:event_planning_app/screens/intro_screen.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: ElevatedButton(onPressed: (){
         FirebaseManager.logOut();
         Navigator.popAndPushNamed(context, IntroScreen.routeName);
        }, child: Text("Log out",style: Theme.of(context).textTheme.titleMedium,
        ))
      ),
    );
  }
}