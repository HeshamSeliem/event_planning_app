import 'package:event_planning_app/firebase/firebase_manager.dart';
import 'package:event_planning_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  UserModel? userModel;
  User? firebaseUser;
     
     UserProvider()
     {
      firebaseUser = FirebaseAuth.instance.currentUser;

      if(firebaseUser != null) // if user exist i must read data from firestore
      {
         initUser();
      }
     }
     initUser()async
     {
       userModel  =await FirebaseManager.readUser();
       notifyListeners();
     }
}