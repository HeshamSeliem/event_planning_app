import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

ThemeMode themeMode = ThemeMode.light;
void changeThemeMode(){
  if(themeMode == ThemeMode.light){
    themeMode = ThemeMode.dark;
}else
{
  themeMode = ThemeMode.light;
}
notifyListeners();   // tell the other files that the provider has changed and took an action
}
}