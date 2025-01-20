import 'package:flutter/material.dart';
// my confirm comment on intro screen
//welcome development branch 
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
static const String routeName = '/intro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(  
     
        minimum: const EdgeInsets.symmetric(horizontal: 16,vertical: 25),
        child: Center(
          child: Column(
            children: [  
              Image.asset("assets/images/header.png",width: 160, height: 50,),
              const SizedBox(height: 28,),
              Image.asset("assets/images/welcome.png"),
               const SizedBox(height: 28,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text("Personalize Your Experience",style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff5669FF),
                      fontWeight: FontWeight.w700
                    )
                   ),
                   
                 ],

               ),
               const SizedBox(height: 28,),
                const Text("Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff1C1C1C),
                      fontWeight: FontWeight.w500
                    )
                  
                   ),
                   const SizedBox(height: 28,),
                  const  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text("Language",style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff5669FF),
                      fontWeight: FontWeight.w700
                    )
                   
                   ),
                 ],

               ),
               const SizedBox(height: 16,),
               const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text("Theme",style:
                 TextStyle(
                      fontSize: 20,
                      color: Color(0xff5669FF),
                      fontWeight: FontWeight.w700
                    )
                   ),
                   
                 ],

               ),
               const SizedBox(height: 28,),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color(0xff5669FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:const EdgeInsets.symmetric(horizontal: 135,vertical: 15)
                ),
                onPressed: (){},
                child: const Text("Let’s Start",style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),)
                )
            ],
          ),
        ),
      ),
    );
  }
}