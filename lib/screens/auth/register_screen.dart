import 'package:event_planning_app/firebase/firebase_manager.dart';
import 'package:event_planning_app/screens/home/home_screen.dart';
import 'package:event_planning_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
//import 'package:todo_c13_sun/firebase/firebase_manager.dart';
//import 'package:todo_c13_sun/screens/auth/login.dart';

//import '../home/home.dart';
//import '../lets_go_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "registerScreen";
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  RegisterScreen({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Color(0xff7B7B7B)),
                    hintText: "Name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email is Required";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                        .hasMatch(value);

                    if (emailValid == false) {
                      return "Email Not valid";
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: const Color(0xff7B7B7B)),
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is Required";
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 Char";
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Color(0xff7B7B7B)),
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: rePasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "RePassword is Required";
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 Char";
                    }
                    if (value != passwordController.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Color(0xff7B7B7B)),
                    hintText: "rePassword",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility_off_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseManager.createAccount(
                          emailController.text, passwordController.text,nameController.text,
                           () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Center(child: CircularProgressIndicator()),
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      }, () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }, (message) {
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
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: const Color(
                        0xff5669FF), // Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Create Account",
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
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already Have Account? ",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                        ),
                        TextSpan(
                            text: "Login",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                  //color: Theme.of(context).primaryColor,
                                )!),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
