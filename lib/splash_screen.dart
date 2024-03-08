import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_shared_preference_demo/home_page.dart';
import 'package:login_shared_preference_demo/login_page.dart';
import 'package:login_shared_preference_demo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String MYLOGINKEY = 'Login';

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(
            child: Icon(
          Icons.account_circle_rounded,
          color: Colors.black87,
          size: 100,
        )),
      ),
    );
  }

  void whereToGo() {
    Timer(const Duration(seconds: 3), () async {
      var prefers = await SharedPreferences.getInstance();
      var isLoggedIn = prefers.getBool(MYLOGINKEY);

      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
  }
}
