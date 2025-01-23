import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_app/screens/home/home_screen.dart';
import 'package:event_planning_app/screens/auth/forget_password.dart';
import 'package:event_planning_app/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emaillController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   LoginScreen({super.key});
 static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/login_image.png',
                height: 150,
              ),
             const SizedBox(
                height: 24,
              ),
              TextField(
                controller: emaillController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration:  InputDecoration(
                  hintText: "Emaill".tr(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: passwordController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: "Password".tr(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
             const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ForgetPassword.routeName);
                    },
                    child: Text(
                      "Forget Password?".tr(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            decoration: TextDecoration.underline,
                           color:const Color(0xff5669FF)
                          )!,
                          
                    )),
              ),
              const SizedBox(
                height: 24,
              ), 
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                 backgroundColor:  Color(0xff5669FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Login".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
           
             const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t Have Account?".tr(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),
                      TextSpan(
                          text: "Create Account".tr(),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    decoration: TextDecoration.underline,
                                     color:const Color(0xff5669FF)
                                  )!),
                    ],
                  ),
                ),
              ),
             const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 40,
                      indent: 10,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    "OR".tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Expanded(
                    child: Divider(
                      endIndent: 40,
                      indent: 10,
                      thickness: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}