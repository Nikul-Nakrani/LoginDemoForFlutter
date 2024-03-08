import 'package:flutter/material.dart';
import 'package:login_shared_preference_demo/login_page.dart';
import 'package:login_shared_preference_demo/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home,
                color: Colors.black87,
                size: 100,
              ),
              InkWell(
                onTap: () async {
                  var prefers = await SharedPreferences.getInstance();
                  prefers.remove(SplashScreenState.MYLOGINKEY);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 100,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black87,
                  ),
                  child: const Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 26),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
