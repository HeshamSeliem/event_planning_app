import 'package:flutter/material.dart';

class AppBarProvider extends ChangeNotifier{
   
   List<String> categoriesImages = [
    "all",
   "birthday",
   "book_club",
   "eating",
   "exhibtion",
   "gaming",
   "holiday",
   "meeting",
   "sport"
  ];
  int selectedIndex = 0;
  onChanged(int index){
    selectedIndex = index;
    notifyListeners();
  }
}