import 'package:flutter/material.dart';
import 'package:login_shared_preference_demo/home_page.dart';
import 'package:login_shared_preference_demo/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle_sharp,
              color: Colors.black,
              size: 100,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: const TextField(
                  decoration: InputDecoration(
                      label: Text('Email'),
                      labelStyle: TextStyle(color: Colors.black87),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.black87)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.black87)))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: const TextField(
                  decoration: InputDecoration(
                      label: Text('Password'),
                      labelStyle: TextStyle(color: Colors.black87),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.black87)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.black87)))),
            ),
            InkWell(
              onTap: () async {
                var prefers = await SharedPreferences.getInstance();
                prefers.setBool(SplashScreenState.MYLOGINKEY, true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black87,
                ),
                child: const Center(
                    child: Text('Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
