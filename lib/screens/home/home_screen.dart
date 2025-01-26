import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_app/screens/create_event/create_event.dart';
import 'package:event_planning_app/screens/home/tabs/home_tab.dart';
import 'package:event_planning_app/screens/home/tabs/profile_tab.dart';
import 'package:event_planning_app/screens/home/tabs/search_tab.dart';
import 'package:event_planning_app/screens/home/tabs/love_tab.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
       
       onPressed: () {
        Navigator.pushNamed(context, CreateEvent.routeName);
       },
          
           
        child: const Icon(Icons.add,color: Colors.white,size: 30,),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() { });
          print(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: "Home".tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.location_on_outlined),
            label: "Search".tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border_outlined),
            label: "Love".tr(),
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline_outlined),
            label: "Profile".tr(),
          ),
        ],
      ),
      body: tabs[currentIndex],
    );
  }
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    LoveTab(),
    ProfileTab(),
  ];
}