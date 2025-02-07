import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier {
  List<String> categoriesImages = [
   "birthday",
   "book_club",
   "eating",
   "exhibtion",
   "gaming",
   "holiday",
   "meeting",
   "sport"
  ];

  int currentEventIndex = 0;
  changeEventType(index)
  {
    currentEventIndex = index;
   notifyListeners();
  }
  var selectedDate = DateTime.now();

              changeDate(date)
              {
                selectedDate = date;
                notifyListeners();
              }
  
}