import 'package:flutter/material.dart';

// my confirm comment on intro screen
//welcome development branch
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  static const String routeName = '/intro';
  @override
  Widget build(BuildContext context) {
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
                    "Personalize Your Experience",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                  "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16)),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Language",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Theme",
                      style: Theme.of(context).textTheme.titleLarge),
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
                  onPressed: () {},
                  child:  Text(
                    "Let’s Start",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
