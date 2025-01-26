import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_app/main.dart';
import 'package:event_planning_app/provider/my_provider.dart';
import 'package:event_planning_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

// my confirm comment on intro screen
//welcome development branch
class IntroScreen extends StatefulWidget {
   IntroScreen({super.key});
  static const String routeName = '/intro';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context); // to tell this app that i want to create object of provider here
    return Scaffold(
      // backgroundColor:const Color(0xffF2FEFF),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/header.png",
                width: 160,
                height: 50,
              ),
              const SizedBox(
                height: 28,
              ),
              Image.asset("assets/images/welcome.png"),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "introduction_title".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                  "introduction_description".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 16)),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "language".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ToggleSwitch(
                    inactiveFgColor: Colors.white,
                    cornerRadius: 50,
                    activeBgColor: [Color(0xff5669FF), Colors.blue.shade200],
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels:const ['Arabic', 'English'],
                    animate: true, // with just animate set to true, default curve = Curves.easeIn
                    curve: Curves.bounceInOut,
                    onToggle: (index) {
                      currentIndex = index!;
                     if(index==0){
                       context.setLocale(const Locale('ar'));
                     }
                     else{
                        context.setLocale(const Locale('en'));
                     }
                     print('switched to: $index');
                     print(context.locale.toString());
                    }
                    
    ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("theme".tr(), style: Theme.of(context).textTheme.titleMedium),
                  ToggleSwitch(
                    inactiveFgColor: Colors.white,
                    cornerRadius: 50,
                    activeBgColor: [Color(0xff5669FF), Colors.blue.shade200],
                   inactiveBgColor: Colors.grey,
                    initialLabelIndex: currentIndex,
                    totalSwitches: 2,
                    animate: true, // with just animate set to true, default curve = Curves.easeIn
                    curve: Curves.bounceInOut, 
                    labels:const ['Light', 'Dark'],
                    onToggle: (index) {
                      currentIndex = index!;
                      setState(() {
                        
                      });
                     provider.changeThemeMode();
                      print('switched to: $index');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5669FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 135, vertical: 15)),
                  onPressed: () 
                  {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Text(
                    "lets_go".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
