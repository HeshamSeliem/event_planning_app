import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_app/firebase/firebase_manager.dart';
import 'package:event_planning_app/provider/user_provider.dart';
import 'package:event_planning_app/screens/home/home_screen.dart';
import 'package:event_planning_app/screens/auth/forget_password.dart';
import 'package:event_planning_app/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emaillController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
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
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Color(0xff7B7B7B)),
                    hintText: "Emaill".tr(),
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor))),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: passwordController,
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Color(0xff7B7B7B)),
                    hintText: "Password".tr(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor))),
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
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          color: const Color(0xff5669FF))!,
                    )),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseManager.logIn(
                      emaillController.text, passwordController.text,
                      //on loading
                      () {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Center(child: CircularProgressIndicator()),
                        backgroundColor: Colors.transparent,
                      ),
                    );
                  },
                      //on success
                      () {
                        userProvider.initUser();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => false,
                    );
                  },
                      //on error
                      (message) {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("some thing went error"),
                        content: Text(message),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"))
                        ],
                      ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Color(0xff5669FF),
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
                        text: "Don’t Have Account?  ".tr(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                      ),
                      TextSpan(
                          text: "Create Account".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  decoration: TextDecoration.underline,
                                  color: const Color(0xff5669FF))!),
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
